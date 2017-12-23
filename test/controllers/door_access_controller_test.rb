require 'test_helper'

class DoorAccessControllerTest < ActionDispatch::IntegrationTest
  setup do
    @door_access = door_access(:one)
  end

  test "should get index" do
    get door_access_url
    assert_response :success
  end

  test "should get new" do
    get new_door_access_url
    assert_response :success
  end

  test "should create door_access" do
    assert_difference('DoorAccess.count') do
      post door_access_url, params: { door_access: { access_group_id: @door_access.access_group_id, door_id: @door_access.door_id } }
    end

    assert_redirected_to door_access_url(DoorAccess.last)
  end

  test "should show door_access" do
    get door_access_url(@door_access)
    assert_response :success
  end

  test "should get edit" do
    get edit_door_access_url(@door_access)
    assert_response :success
  end

  test "should update door_access" do
    patch door_access_url(@door_access), params: { door_access: { access_group_id: @door_access.access_group_id, door_id: @door_access.door_id } }
    assert_redirected_to door_access_url(@door_access)
  end

  test "should destroy door_access" do
    assert_difference('DoorAccess.count', -1) do
      delete door_access_url(@door_access)
    end

    assert_redirected_to door_access_url
  end
end
