require 'test_helper'
class NetFlix::TelevisionTest < Test::Unit::TestCase
  def setup
    @television = NetFlix::Television.new(load_fixture_file('television.xml'))
  end
  
  context "title" do
    should "be named Bones: Season 1" do
    assert_equal @television.title, 'Bones: Season 1'
    end
  end

  context "find" do
    should "return an array of tv" do
      NetFlix::Request.expects(:new).returns(stub(:send => load_fixture_file('television.xml')))
      NetFlix::Television.find( :term => 'pants' ).each do |movie|
        assert_equal NetFlix::Television, movie.class
      end
    end
  end

end
