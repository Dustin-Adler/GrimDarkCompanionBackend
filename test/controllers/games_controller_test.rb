require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game = games(:one)
  end

  test "should get index" do
    get games_url
    assert_response :success
  end

  test "should get new" do
    get new_game_url
    assert_response :success
  end

  test "should create game" do
    assert_difference("Game.count") do
      post games_url, params: { game: { battle_round: @game.battle_round, deployment: @game.deployment, game_name: @game.game_name, id: @game.id, list_value_limit: @game.list_value_limit, mission_rule: @game.mission_rule, note: @game.note, player_one_id: @game.player_one_id, player_one_list_id: @game.player_one_list_id, player_one_vps: @game.player_one_vps, player_two_id: @game.player_two_id, player_two_list_id: @game.player_two_list_id, player_two_vps: @game.player_two_vps } }
    end

    assert_redirected_to game_url(Game.last)
  end

  test "should show game" do
    get game_url(@game)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_url(@game)
    assert_response :success
  end

  test "should update game" do
    patch game_url(@game), params: { game: { battle_round: @game.battle_round, deployment: @game.deployment, game_name: @game.game_name, id: @game.id, list_value_limit: @game.list_value_limit, mission_rule: @game.mission_rule, note: @game.note, player_one_id: @game.player_one_id, player_one_list_id: @game.player_one_list_id, player_one_vps: @game.player_one_vps, player_two_id: @game.player_two_id, player_two_list_id: @game.player_two_list_id, player_two_vps: @game.player_two_vps } }
    assert_redirected_to game_url(@game)
  end

  test "should destroy game" do
    assert_difference("Game.count", -1) do
      delete game_url(@game)
    end

    assert_redirected_to games_url
  end
end
