require "application_system_test_case"

class GamesSecondaryObjectivesTest < ApplicationSystemTestCase
  setup do
    @games_secondary_objective = games_secondary_objectives(:one)
  end

  test "visiting the index" do
    visit games_secondary_objectives_url
    assert_selector "h1", text: "Games secondary objectives"
  end

  test "should create games secondary objective" do
    visit games_secondary_objectives_url
    click_on "New games secondary objective"

    fill_in "Game", with: @games_secondary_objective.game_id
    fill_in "Player", with: @games_secondary_objective.player_id
    fill_in "Secondary objective", with: @games_secondary_objective.secondary_objective_id
    click_on "Create Games secondary objective"

    assert_text "Games secondary objective was successfully created"
    click_on "Back"
  end

  test "should update Games secondary objective" do
    visit games_secondary_objective_url(@games_secondary_objective)
    click_on "Edit this games secondary objective", match: :first

    fill_in "Game", with: @games_secondary_objective.game_id
    fill_in "Player", with: @games_secondary_objective.player_id
    fill_in "Secondary objective", with: @games_secondary_objective.secondary_objective_id
    click_on "Update Games secondary objective"

    assert_text "Games secondary objective was successfully updated"
    click_on "Back"
  end

  test "should destroy Games secondary objective" do
    visit games_secondary_objective_url(@games_secondary_objective)
    click_on "Destroy this games secondary objective", match: :first

    assert_text "Games secondary objective was successfully destroyed"
  end
end
