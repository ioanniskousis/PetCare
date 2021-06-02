require "test_helper"

class FoundPhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @found_photo = found_photos(:one)
  end

  test "should get index" do
    get found_photos_url
    assert_response :success
  end

  test "should get new" do
    get new_found_photo_url
    assert_response :success
  end

  test "should create found_photo" do
    assert_difference('FoundPhoto.count') do
      post found_photos_url, params: { found_photo: { found_id: @found_photo.found_id } }
    end

    assert_redirected_to found_photo_url(FoundPhoto.last)
  end

  test "should show found_photo" do
    get found_photo_url(@found_photo)
    assert_response :success
  end

  test "should get edit" do
    get edit_found_photo_url(@found_photo)
    assert_response :success
  end

  test "should update found_photo" do
    patch found_photo_url(@found_photo), params: { found_photo: { found_id: @found_photo.found_id } }
    assert_redirected_to found_photo_url(@found_photo)
  end

  test "should destroy found_photo" do
    assert_difference('FoundPhoto.count', -1) do
      delete found_photo_url(@found_photo)
    end

    assert_redirected_to found_photos_url
  end
end
