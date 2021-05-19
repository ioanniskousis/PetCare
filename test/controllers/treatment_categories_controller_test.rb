require "test_helper"

class TreatmentCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @treatment_category = treatment_categories(:one)
  end

  test "should get index" do
    get treatment_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_treatment_category_url
    assert_response :success
  end

  test "should create treatment_category" do
    assert_difference('TreatmentCategory.count') do
      post treatment_categories_url, params: { treatment_category: { categoryName: @treatment_category.categoryName, parentCategory: @treatment_category.parentCategory } }
    end

    assert_redirected_to treatment_category_url(TreatmentCategory.last)
  end

  test "should show treatment_category" do
    get treatment_category_url(@treatment_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_treatment_category_url(@treatment_category)
    assert_response :success
  end

  test "should update treatment_category" do
    patch treatment_category_url(@treatment_category), params: { treatment_category: { categoryName: @treatment_category.categoryName, parentCategory: @treatment_category.parentCategory } }
    assert_redirected_to treatment_category_url(@treatment_category)
  end

  test "should destroy treatment_category" do
    assert_difference('TreatmentCategory.count', -1) do
      delete treatment_category_url(@treatment_category)
    end

    assert_redirected_to treatment_categories_url
  end
end
