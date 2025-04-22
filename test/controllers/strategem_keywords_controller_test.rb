require "test_helper"

class StrategemKeywordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @strategem_keyword = strategem_keywords(:one)
  end

  test "should get index" do
    get strategem_keywords_url
    assert_response :success
  end

  test "should get new" do
    get new_strategem_keyword_url
    assert_response :success
  end

  test "should create strategem_keyword" do
    assert_difference("StrategemKeyword.count") do
      post strategem_keywords_url, params: { strategem_keyword: { keyword_id: @strategem_keyword.keyword_id, strategem_id: @strategem_keyword.strategem_id } }
    end

    assert_redirected_to strategem_keyword_url(StrategemKeyword.last)
  end

  test "should show strategem_keyword" do
    get strategem_keyword_url(@strategem_keyword)
    assert_response :success
  end

  test "should get edit" do
    get edit_strategem_keyword_url(@strategem_keyword)
    assert_response :success
  end

  test "should update strategem_keyword" do
    patch strategem_keyword_url(@strategem_keyword), params: { strategem_keyword: { keyword_id: @strategem_keyword.keyword_id, strategem_id: @strategem_keyword.strategem_id } }
    assert_redirected_to strategem_keyword_url(@strategem_keyword)
  end

  test "should destroy strategem_keyword" do
    assert_difference("StrategemKeyword.count", -1) do
      delete strategem_keyword_url(@strategem_keyword)
    end

    assert_redirected_to strategem_keywords_url
  end
end
