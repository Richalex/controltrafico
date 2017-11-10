require 'test_helper'

class RutasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rutas_index_url
    assert_response :success
  end

end
