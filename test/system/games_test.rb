require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  setup do
    @game = games(:one)
  end

  test "visiting the index" do
    visit games_url
    assert_selector "h1", text: "Games"
  end

  test "should create game" do
    visit games_url
    click_on "New game"

    fill_in "Battle round", with: @game.battle_round
    fill_in "Deployment", with: @game.deployment
    fill_in "Game name", with: @game.game_name
    fill_in "Id", with: @game.id
    fill_in "List value limit", with: @game.list_value_limit
    fill_in "Mission rule", with: @game.mission_rule
    fill_in "Note", with: @game.note
    fill_in "Player one", with: @game.player_one_id
    fill_in "Player one list", with: @game.player_one_list_id
    fill_in "Player one vps", with: @game.player_one_vps
    fill_in "Player two", with: @game.player_two_id
    fill_in "Player two list", with: @game.player_two_list_id
    fill_in "Player two vps", with: @game.player_two_vps
    click_on "Create Game"

    assert_text "Game was successfully created"
    click_on "Back"
  end

  test "should update Game" do
    visit game_url(@game)
    click_on "Edit this game", match: :first

    fill_in "Battle round", with: @game.battle_round
    fill_in "Deployment", with: @game.deployment
    fill_in "Game name", with: @game.game_name
    fill_in "Id", with: @game.id
    fill_in "List value limit", with: @game.list_value_limit
    fill_in "Mission rule", with: @game.mission_rule
    fill_in "Note", with: @game.note
    fill_in "Player one", with: @game.player_one_id
    fill_in "Player one list", with: @game.player_one_list_id
    fill_in "Player one vps", with: @game.player_one_vps
    fill_in "Player two", with: @game.player_two_id
    fill_in "Player two list", with: @game.player_two_list_id
    fill_in "Player two vps", with: @game.player_two_vps
    click_on "Update Game"

    assert_text "Game was successfully updated"
    click_on "Back"
  end

  test "should destroy Game" do
    visit game_url(@game)
    click_on "Destroy this game", match: :first

    assert_text "Game was successfully destroyed"
  end
end
