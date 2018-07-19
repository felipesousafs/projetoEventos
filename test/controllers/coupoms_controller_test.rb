require 'test_helper'

class CoupomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coupom = coupoms(:one)
  end

  test "should get index" do
    get coupoms_url
    assert_response :success
  end

  test "should get new" do
    get new_coupom_url
    assert_response :success
  end

  test "should create coupom" do
    assert_difference('Coupom.count') do
      post coupoms_url, params: { coupom: { expiration: @coupom.expiration, key: @coupom.key, value: @coupom.value } }
    end

    assert_redirected_to coupom_url(Coupom.last)
  end

  test "should show coupom" do
    get coupom_url(@coupom)
    assert_response :success
  end

  test "should get edit" do
    get edit_coupom_url(@coupom)
    assert_response :success
  end

  test "should update coupom" do
    patch coupom_url(@coupom), params: { coupom: { expiration: @coupom.expiration, key: @coupom.key, value: @coupom.value } }
    assert_redirected_to coupom_url(@coupom)
  end

  test "should destroy coupom" do
    assert_difference('Coupom.count', -1) do
      delete coupom_url(@coupom)
    end

    assert_redirected_to coupoms_url
  end
end
