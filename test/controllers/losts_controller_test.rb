require "test_helper"

class LostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lost = losts(:one)
  end

  test "should get index" do
    get losts_url
    assert_response :success
  end

  test "should get new" do
    get new_lost_url
    assert_response :success
  end

  test "should create lost" do
    assert_difference('Lost.count') do
      post losts_url, params: { lost: { comments: @lost.comments, resolved: @lost.resolved, user_id: @lost.user_id } }
    end

    assert_redirected_to lost_url(Lost.last)
  end

  test "should show lost" do
    get lost_url(@lost)
    assert_response :success
  end

  test "should get edit" do
    get edit_lost_url(@lost)
    assert_response :success
  end

  test "should update lost" do
    patch lost_url(@lost), params: { lost: { comments: @lost.comments, resolved: @lost.resolved, user_id: @lost.user_id } }
    assert_redirected_to lost_url(@lost)
  end

  test "should destroy lost" do
    assert_difference('Lost.count', -1) do
      delete lost_url(@lost)
    end

    assert_redirected_to losts_url
  end
end
