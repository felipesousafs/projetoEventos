require 'test_helper'

class InscriptionItemsControllerTest < ActionController::TestCase
  setup do
    @inscription = inscriptions(:one)
    @inscription_item = inscription_items(:one)
  end

  test "should get index" do
    get :index, params: { inscription_id: @inscription }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { inscription_id: @inscription }
    assert_response :success
  end

  test "should create inscription_item" do
    assert_difference('InscriptionItem.count') do
      post :create, params: { inscription_id: @inscription, inscription_item: @inscription_item.attributes }
    end

    assert_redirected_to inscription_inscription_item_path(@inscription, InscriptionItem.last)
  end

  test "should show inscription_item" do
    get :show, params: { inscription_id: @inscription, id: @inscription_item }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { inscription_id: @inscription, id: @inscription_item }
    assert_response :success
  end

  test "should update inscription_item" do
    put :update, params: { inscription_id: @inscription, id: @inscription_item, inscription_item: @inscription_item.attributes }
    assert_redirected_to inscription_inscription_item_path(@inscription, InscriptionItem.last)
  end

  test "should destroy inscription_item" do
    assert_difference('InscriptionItem.count', -1) do
      delete :destroy, params: { inscription_id: @inscription, id: @inscription_item }
    end

    assert_redirected_to inscription_inscription_items_path(@inscription)
  end
end
