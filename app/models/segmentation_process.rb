class SegmentationProcess
  attr_reader :image_src

  #
  # Input: None
  # Output: None
  # Description: Downloads a file form a URL and assigns it's path to the @image_src variable
  #
  def initialize
    download = open("http://24.media.tumblr.com/tumblr_lfp3qax6Lm1qfmtrbo1_1280.jpg")
    file = open("public/images/image.jpg", "wb")
    IO.copy_stream(download, file)
    download.close
    file.close
    @image_src = "image.jpg"
  end

  #
  # Input: None
  # Output: image -> Segmented image written to file
  # Description: Segments the downloaded image, calculating it's color histogram
  # => and changing to greyscale the colors with less presence of red
  #
  def process
    image = Magick::ImageList.new("public/images/image.jpg").first
    image_pixels = image.get_pixels(0, 0, image.columns, image.rows)

    histogram = Hash.new
    image_pixels.each do |pixel|
      color = [pixel.red, pixel.green, pixel.blue]
      if(histogram.has_key?(color))
        histogram[color] += 1
      else
        histogram[color] = 0
      end
    end

    histogram = histogram.sort {|a, b| b[0][0] <=> a[0][0]}
    colors = histogram.transpose[0][0...1000]
    image_pixels.each do |pixel|
      if(!colors.include?([pixel.red, pixel.green, pixel.blue]) )
        gray = (pixel.red*0.3 + pixel.green*0.59 + pixel.blue*0.11)
        pixel.red = gray
        pixel.blue = gray
        pixel.green = gray
      end
    end

    image.store_pixels(0,0, image.columns, image.rows, image_pixels)
    image.write("public/images/image.jpg")
  end
end
