class Improc::Detector
  include OpenCV

  def initialize(path)
    @image = cv::imread path, cv::IMREAD_GRAYSCALE
    fail ArgumentError, "Invalid path: #{path}" if @image.data.null?
  end

  def process(type = :orb)
    detector = case type
               when :orb then cv::ORB.create
               else
                 fail ArgumentError, "Unsupported: #{type}"
               end

    keypoints = Vector.new cv::KeyPoint
    descriptors = cv::Mat.new
    detector.detect_and_compute @image, cv::Mat.new, keypoints, descriptors

    [keypoints, descriptors]
  end
end

