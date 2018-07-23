require 'test_helper'

class EventItemsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
    @event_item = event_items(:one)
  end

  test "should get index" do
    get :index, params: { event_id: @event }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { event_id: @event }
    assert_response :success
  end

  test "should create event_item" do
    assert_difference('EventItem.count') do
      post :create, params: { event_id: @event, event_item: @event_item.attributes }
    end

    assert_redirected_to event_event_item_path(@event, EventItem.last)
  end

  test "should show event_item" do
    get :show, params: { event_id: @event, id: @event_item }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { event_id: @event, id: @event_item }
    assert_response :success
  end

  test "should update event_item" do
    put :update, params: { event_id: @event, id: @event_item, event_item: @event_item.attributes }
    assert_redirected_to event_event_item_path(@event, EventItem.last)
  end

  test "should destroy event_item" do
    assert_difference('EventItem.count', -1) do
      delete :destroy, params: { event_id: @event, id: @event_item }
    end

    assert_redirected_to event_event_items_path(@event)
  end
end
