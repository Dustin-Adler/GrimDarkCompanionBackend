require "test_helper"

class ExcludedStrategemKeywordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @excluded_strategem_keyword = excluded_strategem_keywords(:one)
  end

  test "should get index" do
    get excluded_strategem_keywords_url
    assert_response :success
  end

  test "should get new" do
    get new_excluded_strategem_keyword_url
    assert_response :success
  end

  test "should create excluded_strategem_keyword" do
    assert_difference("ExcludedStrategemKeyword.count") do
      post excluded_strategem_keywords_url, params: { excluded_strategem_keyword: { keyword_id: @excluded_strategem_keyword.keyword_id, strategem_id: @excluded_strategem_keyword.strategem_id } }
    end

    assert_redirected_to excluded_strategem_keyword_url(ExcludedStrategemKeyword.last)
  end

  test "should show excluded_strategem_keyword" do
    get excluded_strategem_keyword_url(@excluded_strategem_keyword)
    assert_response :success
  end

  test "should get edit" do
    get edit_excluded_strategem_keyword_url(@excluded_strategem_keyword)
    assert_response :success
  end

  test "should update excluded_strategem_keyword" do
    patch excluded_strategem_keyword_url(@excluded_strategem_keyword), params: { excluded_strategem_keyword: { keyword_id: @excluded_strategem_keyword.keyword_id, strategem_id: @excluded_strategem_keyword.strategem_id } }
    assert_redirected_to excluded_strategem_keyword_url(@excluded_strategem_keyword)
  end

  test "should destroy excluded_strategem_keyword" do
    assert_difference("ExcludedStrategemKeyword.count", -1) do
      delete excluded_strategem_keyword_url(@excluded_strategem_keyword)
    end

    assert_redirected_to excluded_strategem_keywords_url
  end
end
