require 'test_helper'

class InformationquotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @informationquote = informationquotes(:one)
  end

  test "should get index" do
    get informationquotes_url, as: :json
    assert_response :success
  end

  test "should create informationquote" do
    assert_difference('Informationquote.count') do
      post informationquotes_url, params: { informationquote: { attributeproduct_id: @informationquote.attributeproduct_id, quote_id: @informationquote.quote_id, value: @informationquote.value } }, as: :json
    end

    assert_response 201
  end

  test "should show informationquote" do
    get informationquote_url(@informationquote), as: :json
    assert_response :success
  end

  test "should update informationquote" do
    patch informationquote_url(@informationquote), params: { informationquote: { attributeproduct_id: @informationquote.attributeproduct_id, quote_id: @informationquote.quote_id, value: @informationquote.value } }, as: :json
    assert_response 200
  end

  test "should destroy informationquote" do
    assert_difference('Informationquote.count', -1) do
      delete informationquote_url(@informationquote), as: :json
    end

    assert_response 204
  end
end
