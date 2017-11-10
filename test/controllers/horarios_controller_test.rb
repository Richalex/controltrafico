require 'test_helper'

class HorariosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get horarios_index_url
    assert_response :success
  end

end
