require "test_helper"

class PurchaseBoatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get purchase_boats_index_url
    assert_response :success
  end
end
