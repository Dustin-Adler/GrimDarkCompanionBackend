require "test_helper"

class EnhancementKeywordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enhancement_keyword = enhancement_keywords(:one)
  end

  test "should get index" do
    get enhancement_keywords_url
    assert_response :success
  end

  test "should get new" do
    get new_enhancement_keyword_url
    assert_response :success
  end

  test "should create enhancement_keyword" do
    assert_difference("EnhancementKeyword.count") do
      post enhancement_keywords_url, params: { enhancement_keyword: { enhancement_id: @enhancement_keyword.enhancement_id, keyword_id: @enhancement_keyword.keyword_id } }
    end

    assert_redirected_to enhancement_keyword_url(EnhancementKeyword.last)
  end

  test "should show enhancement_keyword" do
    get enhancement_keyword_url(@enhancement_keyword)
    assert_response :success
  end

  test "should get edit" do
    get edit_enhancement_keyword_url(@enhancement_keyword)
    assert_response :success
  end

  test "should update enhancement_keyword" do
    patch enhancement_keyword_url(@enhancement_keyword), params: { enhancement_keyword: { enhancement_id: @enhancement_keyword.enhancement_id, keyword_id: @enhancement_keyword.keyword_id } }
    assert_redirected_to enhancement_keyword_url(@enhancement_keyword)
  end

  test "should destroy enhancement_keyword" do
    assert_difference("EnhancementKeyword.count", -1) do
      delete enhancement_keyword_url(@enhancement_keyword)
    end

    assert_redirected_to enhancement_keywords_url
  end
end
