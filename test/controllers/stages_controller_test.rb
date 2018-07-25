require 'test_helper'

class StagesControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
    @stage = stages(:one)
  end

  test "should get index" do
    get :index, params: { event_id: @event }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { event_id: @event }
    assert_response :success
  end

  test "should create stage" do
    assert_difference('Stage.count') do
      post :create, params: { event_id: @event, stage: @stage.attributes }
    end

    assert_redirected_to event_stage_path(@event, Stage.last)
  end

  test "should show stage" do
    get :show, params: { event_id: @event, id: @stage }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { event_id: @event, id: @stage }
    assert_response :success
  end

  test "should update stage" do
    put :update, params: { event_id: @event, id: @stage, stage: @stage.attributes }
    assert_redirected_to event_stage_path(@event, Stage.last)
  end

  test "should destroy stage" do
    assert_difference('Stage.count', -1) do
      delete :destroy, params: { event_id: @event, id: @stage }
    end

    assert_redirected_to event_stages_path(@event)
  end
end
