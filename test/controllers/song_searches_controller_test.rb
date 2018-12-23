require 'test_helper'

class SongSearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get song_searches_index_url
    assert_response :success
  end

  test "should get show" do
    get song_searches_show_url
    assert_response :success
  end

end
