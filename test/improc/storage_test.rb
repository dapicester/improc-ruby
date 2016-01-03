require 'test_helper'

class Improc::StorageTest < Minitest::Test
  def test_store_path_for
    assert_equal 'test/images/wine.yml.gz', Improc::Storage.path_for(Fixtures::WINE)
  end

  def setup
    @path = Improc::Storage.path_for Fixtures::WINE
    refute File.exist? @path

    @storage = Improc::Storage.new @path
  end

  def teardown
    File.delete @path if File.exists? @path
  end

  def test_storage
    kp, des = Improc::Detector.new(Fixtures::WINE).process
    @storage.store kp, des
    assert File.exist? @path

    lkp, ldes = @storage.load
    assert_equal kp.size, lkp.size
    assert_equal des.size.width, ldes.size.width
    assert_equal des.size.height, ldes.size.height
  end
end
