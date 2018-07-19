require 'test_helper'

class EventItemTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_item_type = event_item_types(:one)
  end

  test "should get index" do
    get event_item_types_url
    assert_response :success
  end

  test "should get new" do
    get new_event_item_type_url
    assert_response :success
  end

  test "should create event_item_type" do
    assert_difference('EventItemType.count') do
      post event_item_types_url, params: { event_item_type: { name: @event_item_type.name } }
    end

    assert_redirected_to event_item_type_url(EventItemType.last)
  end

  test "should show event_item_type" do
    get event_item_type_url(@event_item_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_item_type_url(@event_item_type)
    assert_response :success
  end

  test "should update event_item_type" do
    patch event_item_type_url(@event_item_type), params: { event_item_type: { name: @event_item_type.name } }
    assert_redirected_to event_item_type_url(@event_item_type)
  end

  test "should destroy event_item_type" do
    assert_difference('EventItemType.count', -1) do
      delete event_item_type_url(@event_item_type)
    end

    assert_redirected_to event_item_types_url
  end
end
