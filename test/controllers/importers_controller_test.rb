require 'test_helper'

class ImportersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get importers_index_url
    assert_response :success
  end

  test "should get new" do
    get importers_new_url
    assert_response :success
  end

  test "should get create" do
    get importers_create_url
    assert_response :success
  end

  test "should get permitted_params" do
    get importers_permitted_params_url
    assert_response :success
  end

end
