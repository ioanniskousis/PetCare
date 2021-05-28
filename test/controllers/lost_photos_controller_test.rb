require "test_helper"

class LostPhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lost_photo = lost_photos(:one)
  end

  test "should get index" do
    get lost_photos_url
    assert_response :success
  end

  test "should get new" do
    get new_lost_photo_url
    assert_response :success
  end

  test "should create lost_photo" do
    assert_difference('LostPhoto.count') do
      post lost_photos_url, params: { lost_photo: {  } }
    end

    assert_redirected_to lost_photo_url(LostPhoto.last)
  end

  test "should show lost_photo" do
    get lost_photo_url(@lost_photo)
    assert_response :success
  end

  test "should get edit" do
    get edit_lost_photo_url(@lost_photo)
    assert_response :success
  end

  test "should update lost_photo" do
    patch lost_photo_url(@lost_photo), params: { lost_photo: {  } }
    assert_redirected_to lost_photo_url(@lost_photo)
  end

  test "should destroy lost_photo" do
    assert_difference('LostPhoto.count', -1) do
      delete lost_photo_url(@lost_photo)
    end

    assert_redirected_to lost_photos_url
  end
end
