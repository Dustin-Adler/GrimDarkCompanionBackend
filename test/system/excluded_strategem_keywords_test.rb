require "application_system_test_case"

class ExcludedStrategemKeywordsTest < ApplicationSystemTestCase
  setup do
    @excluded_strategem_keyword = excluded_strategem_keywords(:one)
  end

  test "visiting the index" do
    visit excluded_strategem_keywords_url
    assert_selector "h1", text: "Excluded strategem keywords"
  end

  test "should create excluded strategem keyword" do
    visit excluded_strategem_keywords_url
    click_on "New excluded strategem keyword"

    fill_in "Keyword", with: @excluded_strategem_keyword.keyword_id
    fill_in "Strategem", with: @excluded_strategem_keyword.strategem_id
    click_on "Create Excluded strategem keyword"

    assert_text "Excluded strategem keyword was successfully created"
    click_on "Back"
  end

  test "should update Excluded strategem keyword" do
    visit excluded_strategem_keyword_url(@excluded_strategem_keyword)
    click_on "Edit this excluded strategem keyword", match: :first

    fill_in "Keyword", with: @excluded_strategem_keyword.keyword_id
    fill_in "Strategem", with: @excluded_strategem_keyword.strategem_id
    click_on "Update Excluded strategem keyword"

    assert_text "Excluded strategem keyword was successfully updated"
    click_on "Back"
  end

  test "should destroy Excluded strategem keyword" do
    visit excluded_strategem_keyword_url(@excluded_strategem_keyword)
    click_on "Destroy this excluded strategem keyword", match: :first

    assert_text "Excluded strategem keyword was successfully destroyed"
  end
end
