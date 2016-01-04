require 'rake/ext/string'

class Improc::Storage
  include OpenCV

  def self.path_for(image_path)
    image_path.pathmap '%X.yml.gz'
  end

  def initialize(path)
    @path = path
  end

  def store(keypoints, descriptors)
    cv::FileStorage.with(@path, cv::FileStorage::WRITE) do |fs|
      fs << 'keypoints' << keypoints
      fs << 'descriptors' << descriptors
    end
  end

  def load
    return false unless File.exists? @path
    keypoints = Vector.new cv::KeyPoint
    descriptors = cv::Mat.new
    cv::FileStorage.with(@path, cv::FileStorage::READ) do |fs|
      fs['keypoints'] >> keypoints
      fs['descriptors'] >> descriptors
    end
    [keypoints, descriptors]
  end
end
