require "application_system_test_case"

class ModelKeywordsTest < ApplicationSystemTestCase
  setup do
    @model_keyword = model_keywords(:one)
  end

  test "visiting the index" do
    visit model_keywords_url
    assert_selector "h1", text: "Model keywords"
  end

  test "should create model keyword" do
    visit model_keywords_url
    click_on "New model keyword"

    fill_in "Keyword", with: @model_keyword.keyword_id
    fill_in "Model", with: @model_keyword.model_id
    click_on "Create Model keyword"

    assert_text "Model keyword was successfully created"
    click_on "Back"
  end

  test "should update Model keyword" do
    visit model_keyword_url(@model_keyword)
    click_on "Edit this model keyword", match: :first

    fill_in "Keyword", with: @model_keyword.keyword_id
    fill_in "Model", with: @model_keyword.model_id
    click_on "Update Model keyword"

    assert_text "Model keyword was successfully updated"
    click_on "Back"
  end

  test "should destroy Model keyword" do
    visit model_keyword_url(@model_keyword)
    click_on "Destroy this model keyword", match: :first

    assert_text "Model keyword was successfully destroyed"
  end
end
