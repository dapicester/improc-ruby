require 'test_helper'

class ImprocTest < Minitest::Test
  def test_version_number
    refute_nil ::Improc::VERSION
  end

  def test_loads_ropencv_additions
    assert ::OpenCV::Cv::FileStorage.respond_to? :with
    assert ::OpenCV::Cv::FileNode.new.respond_to? :>>
  end
end
