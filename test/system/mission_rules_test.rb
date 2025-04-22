require "application_system_test_case"

class MissionRulesTest < ApplicationSystemTestCase
  setup do
    @mission_rule = mission_rules(:one)
  end

  test "visiting the index" do
    visit mission_rules_url
    assert_selector "h1", text: "Mission rules"
  end

  test "should create mission rule" do
    visit mission_rules_url
    click_on "New mission rule"

    fill_in "Description", with: @mission_rule.description
    fill_in "Name", with: @mission_rule.name
    click_on "Create Mission rule"

    assert_text "Mission rule was successfully created"
    click_on "Back"
  end

  test "should update Mission rule" do
    visit mission_rule_url(@mission_rule)
    click_on "Edit this mission rule", match: :first

    fill_in "Description", with: @mission_rule.description
    fill_in "Name", with: @mission_rule.name
    click_on "Update Mission rule"

    assert_text "Mission rule was successfully updated"
    click_on "Back"
  end

  test "should destroy Mission rule" do
    visit mission_rule_url(@mission_rule)
    click_on "Destroy this mission rule", match: :first

    assert_text "Mission rule was successfully destroyed"
  end
end
