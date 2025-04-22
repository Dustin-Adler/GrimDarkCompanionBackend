require "application_system_test_case"

class StrategemKeywordsTest < ApplicationSystemTestCase
  setup do
    @strategem_keyword = strategem_keywords(:one)
  end

  test "visiting the index" do
    visit strategem_keywords_url
    assert_selector "h1", text: "Strategem keywords"
  end

  test "should create strategem keyword" do
    visit strategem_keywords_url
    click_on "New strategem keyword"

    fill_in "Keyword", with: @strategem_keyword.keyword_id
    fill_in "Strategem", with: @strategem_keyword.strategem_id
    click_on "Create Strategem keyword"

    assert_text "Strategem keyword was successfully created"
    click_on "Back"
  end

  test "should update Strategem keyword" do
    visit strategem_keyword_url(@strategem_keyword)
    click_on "Edit this strategem keyword", match: :first

    fill_in "Keyword", with: @strategem_keyword.keyword_id
    fill_in "Strategem", with: @strategem_keyword.strategem_id
    click_on "Update Strategem keyword"

    assert_text "Strategem keyword was successfully updated"
    click_on "Back"
  end

  test "should destroy Strategem keyword" do
    visit strategem_keyword_url(@strategem_keyword)
    click_on "Destroy this strategem keyword", match: :first

    assert_text "Strategem keyword was successfully destroyed"
  end
end
