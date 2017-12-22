require 'test_helper'

class CardGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card_group = card_groups(:one)
  end

  test "should get index" do
    get card_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_card_group_url
    assert_response :success
  end

  test "should create card_group" do
    assert_difference('CardGroup.count') do
      post card_groups_url, params: { card_group: { access_group_id: @card_group.access_group_id, card_id: @card_group.card_id } }
    end

    assert_redirected_to card_group_url(CardGroup.last)
  end

  test "should show card_group" do
    get card_group_url(@card_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_card_group_url(@card_group)
    assert_response :success
  end

  test "should update card_group" do
    patch card_group_url(@card_group), params: { card_group: { access_group_id: @card_group.access_group_id, card_id: @card_group.card_id } }
    assert_redirected_to card_group_url(@card_group)
  end

  test "should destroy card_group" do
    assert_difference('CardGroup.count', -1) do
      delete card_group_url(@card_group)
    end

    assert_redirected_to card_groups_url
  end
end
