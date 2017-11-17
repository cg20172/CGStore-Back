require 'test_helper'

class AttributeproductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attributeproduct = attributeproducts(:one)
  end

  test "should get index" do
    get attributeproducts_url, as: :json
    assert_response :success
  end

  test "should create attributeproduct" do
    assert_difference('Attributeproduct.count') do
      post attributeproducts_url, params: { attributeproduct: { attribute_id: @attributeproduct.attribute_id, product_id: @attributeproduct.product_id, range: @attributeproduct.range } }, as: :json
    end

    assert_response 201
  end

  test "should show attributeproduct" do
    get attributeproduct_url(@attributeproduct), as: :json
    assert_response :success
  end

  test "should update attributeproduct" do
    patch attributeproduct_url(@attributeproduct), params: { attributeproduct: { attribute_id: @attributeproduct.attribute_id, product_id: @attributeproduct.product_id, range: @attributeproduct.range } }, as: :json
    assert_response 200
  end

  test "should destroy attributeproduct" do
    assert_difference('Attributeproduct.count', -1) do
      delete attributeproduct_url(@attributeproduct), as: :json
    end

    assert_response 204
  end
end
