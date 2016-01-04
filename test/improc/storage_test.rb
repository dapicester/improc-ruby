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

  def test_file_not_exists
    @storage = Improc::Storage.new 'foobar'
    refute @storage.load
  end

  def test_storage
    kp, des = Improc::Detector.new(Fixtures::WINE).process
    @storage.store kp, des
    assert File.exist? @path

    lkp, ldes = @storage.load
    assert_equal kp, lkp
    assert_equal des, ldes
  end
end
