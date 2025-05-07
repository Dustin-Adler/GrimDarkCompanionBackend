require "application_system_test_case"

class SquadLeadersTest < ApplicationSystemTestCase
  setup do
    @squad_leader = squad_leaders(:one)
  end

  test "visiting the index" do
    visit squad_leaders_url
    assert_selector "h1", text: "Squad leaders"
  end

  test "should create squad leader" do
    visit squad_leaders_url
    click_on "New squad leader"

    fill_in "Leader", with: @squad_leader.leader_id
    fill_in "Squad", with: @squad_leader.squad_id
    click_on "Create Squad leader"

    assert_text "Squad leader was successfully created"
    click_on "Back"
  end

  test "should update Squad leader" do
    visit squad_leader_url(@squad_leader)
    click_on "Edit this squad leader", match: :first

    fill_in "Leader", with: @squad_leader.leader_id
    fill_in "Squad", with: @squad_leader.squad_id
    click_on "Update Squad leader"

    assert_text "Squad leader was successfully updated"
    click_on "Back"
  end

  test "should destroy Squad leader" do
    visit squad_leader_url(@squad_leader)
    click_on "Destroy this squad leader", match: :first

    assert_text "Squad leader was successfully destroyed"
  end
end
