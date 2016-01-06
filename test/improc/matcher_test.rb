require 'test_helper'

class Improc::MatcherTest < Minitest::Test
  def setup
    _, @des1 = Improc::Detector.new(Fixtures::WINE).process
    _, @des2 = Improc::Detector.new(Fixtures::SCENE).process
    @matcher = Improc::Matcher.new
  end

  def test_initializer
    assert Improc::Matcher.new
    assert Improc::Matcher.new 'BruteForce'
    assert Improc::Matcher.new 'BruteForce-L1'
    assert Improc::Matcher.new 'BruteForce-Hamming'
    assert Improc::Matcher.new 'BruteForce-Hamming(2)'
    assert Improc::Matcher.new 'FlannBased'
    assert_raises(ArgumentError) { Improc::Matcher.new type: 'Foobar' }
  end

  def test_match
    assert @matcher.knn_match? @des1, @des1
    refute @matcher.knn_match? @des1, @des2
  end
end
