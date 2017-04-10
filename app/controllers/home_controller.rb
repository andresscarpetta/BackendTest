class HomeController < ApplicationController
  #
  # Input: None
  # Output: None
  # Description: Loads the template view for the index action
  #
  def index
    #code
  end

  #
  # Input: None
  # Output: None
  # Description: Creates a SegmentationProcess object for image segmentation
  #
  def show_results
    @results = SegmentationProcess.new()
    @results.process()
    send_file(@results.image_src, { type: "image/jpeg", disposition: 'inline' })
  end
end
