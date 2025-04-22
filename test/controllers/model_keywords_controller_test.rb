require "test_helper"

class ModelKeywordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @model_keyword = model_keywords(:one)
  end

  test "should get index" do
    get model_keywords_url
    assert_response :success
  end

  test "should get new" do
    get new_model_keyword_url
    assert_response :success
  end

  test "should create model_keyword" do
    assert_difference("ModelKeyword.count") do
      post model_keywords_url, params: { model_keyword: { keyword_id: @model_keyword.keyword_id, model_id: @model_keyword.model_id } }
    end

    assert_redirected_to model_keyword_url(ModelKeyword.last)
  end

  test "should show model_keyword" do
    get model_keyword_url(@model_keyword)
    assert_response :success
  end

  test "should get edit" do
    get edit_model_keyword_url(@model_keyword)
    assert_response :success
  end

  test "should update model_keyword" do
    patch model_keyword_url(@model_keyword), params: { model_keyword: { keyword_id: @model_keyword.keyword_id, model_id: @model_keyword.model_id } }
    assert_redirected_to model_keyword_url(@model_keyword)
  end

  test "should destroy model_keyword" do
    assert_difference("ModelKeyword.count", -1) do
      delete model_keyword_url(@model_keyword)
    end

    assert_redirected_to model_keywords_url
  end
end
