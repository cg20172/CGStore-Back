require 'test_helper'

class TypeproductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @typeproduct = typeproducts(:one)
  end

  test "should get index" do
    get typeproducts_url, as: :json
    assert_response :success
  end

  test "should create typeproduct" do
    assert_difference('Typeproduct.count') do
      post typeproducts_url, params: { typeproduct: { name: @typeproduct.name, product_id: @typeproduct.product_id } }, as: :json
    end

    assert_response 201
  end

  test "should show typeproduct" do
    get typeproduct_url(@typeproduct), as: :json
    assert_response :success
  end

  test "should update typeproduct" do
    patch typeproduct_url(@typeproduct), params: { typeproduct: { name: @typeproduct.name, product_id: @typeproduct.product_id } }, as: :json
    assert_response 200
  end

  test "should destroy typeproduct" do
    assert_difference('Typeproduct.count', -1) do
      delete typeproduct_url(@typeproduct), as: :json
    end

    assert_response 204
  end
end
