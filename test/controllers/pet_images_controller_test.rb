require "test_helper"

class PetImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pet_image = pet_images(:one)
  end

  test "should get index" do
    get pet_images_url
    assert_response :success
  end

  test "should get new" do
    get new_pet_image_url
    assert_response :success
  end

  test "should create pet_image" do
    assert_difference('PetImage.count') do
      post pet_images_url, params: { pet_image: {  } }
    end

    assert_redirected_to pet_image_url(PetImage.last)
  end

  test "should show pet_image" do
    get pet_image_url(@pet_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_pet_image_url(@pet_image)
    assert_response :success
  end

  test "should update pet_image" do
    patch pet_image_url(@pet_image), params: { pet_image: {  } }
    assert_redirected_to pet_image_url(@pet_image)
  end

  test "should destroy pet_image" do
    assert_difference('PetImage.count', -1) do
      delete pet_image_url(@pet_image)
    end

    assert_redirected_to pet_images_url
  end
end
