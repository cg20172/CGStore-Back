require 'test_helper'

class AttributesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attribute = attributes(:one)
  end

  test "should get index" do
    get attributes_url, as: :json
    assert_response :success
  end

  test "should create attribute" do
    assert_difference('Attribute.count') do
      post attributes_url, params: { attribute: { name: @attribute.name, typefeature: @attribute.type } }, as: :json
    end

    assert_response 201
  end

  test "should show attribute" do
    get attribute_url(@attribute), as: :json
    assert_response :success
  end

  test "should update attribute" do
    patch attribute_url(@attribute), params: { attribute: { name: @attribute.name, typefeature: @attribute.type } }, as: :json
    assert_response 200
  end

  test "should destroy attribute" do
    assert_difference('Attribute.count', -1) do
      delete attribute_url(@attribute), as: :json
    end

    assert_response 204
  end
end
