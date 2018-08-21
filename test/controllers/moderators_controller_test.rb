require 'test_helper'

class ModeratorsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
    @moderator = moderators(:one)
  end

  test "should get index" do
    get :index, params: { event_id: @event }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { event_id: @event }
    assert_response :success
  end

  test "should create moderator" do
    assert_difference('Moderator.count') do
      post :create, params: { event_id: @event, moderator: @moderator.attributes }
    end

    assert_redirected_to event_moderator_path(@event, Moderator.last)
  end

  test "should show moderator" do
    get :show, params: { event_id: @event, id: @moderator }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { event_id: @event, id: @moderator }
    assert_response :success
  end

  test "should update moderator" do
    put :update, params: { event_id: @event, id: @moderator, moderator: @moderator.attributes }
    assert_redirected_to event_moderator_path(@event, Moderator.last)
  end

  test "should destroy moderator" do
    assert_difference('Moderator.count', -1) do
      delete :destroy, params: { event_id: @event, id: @moderator }
    end

    assert_redirected_to event_moderators_path(@event)
  end
end
