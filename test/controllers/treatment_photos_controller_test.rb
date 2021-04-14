require "test_helper"

class TreatmentPhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @treatment_photo = treatment_photos(:one)
  end

  test "should get index" do
    get treatment_photos_url
    assert_response :success
  end

  test "should get new" do
    get new_treatment_photo_url
    assert_response :success
  end

  test "should create treatment_photo" do
    assert_difference('TreatmentPhoto.count') do
      post treatment_photos_url, params: { treatment_photo: {  } }
    end

    assert_redirected_to treatment_photo_url(TreatmentPhoto.last)
  end

  test "should show treatment_photo" do
    get treatment_photo_url(@treatment_photo)
    assert_response :success
  end

  test "should get edit" do
    get edit_treatment_photo_url(@treatment_photo)
    assert_response :success
  end

  test "should update treatment_photo" do
    patch treatment_photo_url(@treatment_photo), params: { treatment_photo: {  } }
    assert_redirected_to treatment_photo_url(@treatment_photo)
  end

  test "should destroy treatment_photo" do
    assert_difference('TreatmentPhoto.count', -1) do
      delete treatment_photo_url(@treatment_photo)
    end

    assert_redirected_to treatment_photos_url
  end
end
