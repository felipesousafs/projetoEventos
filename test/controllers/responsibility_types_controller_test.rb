require 'test_helper'

class ResponsibilityTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @responsibility_type = responsibility_types(:one)
  end

  test "should get index" do
    get responsibility_types_url
    assert_response :success
  end

  test "should get new" do
    get new_responsibility_type_url
    assert_response :success
  end

  test "should create responsibility_type" do
    assert_difference('ResponsibilityType.count') do
      post responsibility_types_url, params: { responsibility_type: { name: @responsibility_type.name } }
    end

    assert_redirected_to responsibility_type_url(ResponsibilityType.last)
  end

  test "should show responsibility_type" do
    get responsibility_type_url(@responsibility_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_responsibility_type_url(@responsibility_type)
    assert_response :success
  end

  test "should update responsibility_type" do
    patch responsibility_type_url(@responsibility_type), params: { responsibility_type: { name: @responsibility_type.name } }
    assert_redirected_to responsibility_type_url(@responsibility_type)
  end

  test "should destroy responsibility_type" do
    assert_difference('ResponsibilityType.count', -1) do
      delete responsibility_type_url(@responsibility_type)
    end

    assert_redirected_to responsibility_types_url
  end
end
