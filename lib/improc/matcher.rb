class Improc::Matcher
  include OpenCV

  attr_accessor :threshold

  def initialize(type = 'BruteForce-Hamming')
    @matcher = cv::DescriptorMatcher::create type
    @threshold = 20
  rescue => e
    raise ArgumentError.new e
  end

  def knn_match(des1, des2, k = 2)
    matches = Vector.new Vector.new cv::DMatch
    @matcher.knn_match des1, des2, matches, k
    ratio_test matches
  end

  def knn_match?(des1, des2, k = 2)
    knn_match(des1, des2, k).count >= @threshold
  end

  private

  def ratio_test(matches, ratio = 0.7)
    matches.each_with_object(Vector.new cv::DMatch) do |match, good|
      m, n = match[0], match[1]
      good << m if m.distance < ratio * n.distance
    end
  end
end
