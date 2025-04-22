require "application_system_test_case"

class EnhancementKeywordsTest < ApplicationSystemTestCase
  setup do
    @enhancement_keyword = enhancement_keywords(:one)
  end

  test "visiting the index" do
    visit enhancement_keywords_url
    assert_selector "h1", text: "Enhancement keywords"
  end

  test "should create enhancement keyword" do
    visit enhancement_keywords_url
    click_on "New enhancement keyword"

    fill_in "Enhancement", with: @enhancement_keyword.enhancement_id
    fill_in "Keyword", with: @enhancement_keyword.keyword_id
    click_on "Create Enhancement keyword"

    assert_text "Enhancement keyword was successfully created"
    click_on "Back"
  end

  test "should update Enhancement keyword" do
    visit enhancement_keyword_url(@enhancement_keyword)
    click_on "Edit this enhancement keyword", match: :first

    fill_in "Enhancement", with: @enhancement_keyword.enhancement_id
    fill_in "Keyword", with: @enhancement_keyword.keyword_id
    click_on "Update Enhancement keyword"

    assert_text "Enhancement keyword was successfully updated"
    click_on "Back"
  end

  test "should destroy Enhancement keyword" do
    visit enhancement_keyword_url(@enhancement_keyword)
    click_on "Destroy this enhancement keyword", match: :first

    assert_text "Enhancement keyword was successfully destroyed"
  end
end
