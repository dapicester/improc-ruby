require 'test_helper'

class Improc::DetectorTest < Minitest::Test
  def setup
    @detector = Improc::Detector.new Fixtures::WINE
  end

  def test_initialize_failure
    assert_raises(ArgumentError) { Improc::Detector.new 'foobar' }
  end

  def test_process_failure
    assert_raises(ArgumentError) { @detector.process :foo }
  end

  def test_process_orb
    kp, des = @detector.process :orb

    assert kp.is_a? OpenCV::Std::Vector::Cv_KeyPoint
    assert kp.size > 0

    assert des.is_a? OpenCV::Cv::Mat
    assert_equal kp.size, des.size.height
  end
end
