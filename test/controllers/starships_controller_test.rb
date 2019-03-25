require 'test_helper'

class StarshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get starships_show_url
    assert_response :success
  end

end
