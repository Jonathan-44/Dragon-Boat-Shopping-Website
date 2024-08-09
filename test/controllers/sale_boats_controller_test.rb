require "test_helper"

class SaleBoatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sale_boats_index_url
    assert_response :success
  end
end
