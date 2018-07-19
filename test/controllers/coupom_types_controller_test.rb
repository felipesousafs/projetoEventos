require 'test_helper'

class CoupomTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coupom_type = coupom_types(:one)
  end

  test "should get index" do
    get coupom_types_url
    assert_response :success
  end

  test "should get new" do
    get new_coupom_type_url
    assert_response :success
  end

  test "should create coupom_type" do
    assert_difference('CoupomType.count') do
      post coupom_types_url, params: { coupom_type: { name: @coupom_type.name } }
    end

    assert_redirected_to coupom_type_url(CoupomType.last)
  end

  test "should show coupom_type" do
    get coupom_type_url(@coupom_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_coupom_type_url(@coupom_type)
    assert_response :success
  end

  test "should update coupom_type" do
    patch coupom_type_url(@coupom_type), params: { coupom_type: { name: @coupom_type.name } }
    assert_redirected_to coupom_type_url(@coupom_type)
  end

  test "should destroy coupom_type" do
    assert_difference('CoupomType.count', -1) do
      delete coupom_type_url(@coupom_type)
    end

    assert_redirected_to coupom_types_url
  end
end
