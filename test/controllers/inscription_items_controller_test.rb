require 'test_helper'

class InscriptionItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inscription_item = inscription_items(:one)
  end

  test "should get index" do
    get inscription_items_url
    assert_response :success
  end

  test "should get new" do
    get new_inscription_item_url
    assert_response :success
  end

  test "should create inscription_item" do
    assert_difference('InscriptionItem.count') do
      post inscription_items_url, params: { inscription_item: { name: @inscription_item.name, value: @inscription_item.value } }
    end

    assert_redirected_to inscription_item_url(InscriptionItem.last)
  end

  test "should show inscription_item" do
    get inscription_item_url(@inscription_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_inscription_item_url(@inscription_item)
    assert_response :success
  end

  test "should update inscription_item" do
    patch inscription_item_url(@inscription_item), params: { inscription_item: { name: @inscription_item.name, value: @inscription_item.value } }
    assert_redirected_to inscription_item_url(@inscription_item)
  end

  test "should destroy inscription_item" do
    assert_difference('InscriptionItem.count', -1) do
      delete inscription_item_url(@inscription_item)
    end

    assert_redirected_to inscription_items_url
  end
end
