require "test_helper"

class GamesSecondaryObjectivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @games_secondary_objective = games_secondary_objectives(:one)
  end

  test "should get index" do
    get games_secondary_objectives_url
    assert_response :success
  end

  test "should get new" do
    get new_games_secondary_objective_url
    assert_response :success
  end

  test "should create games_secondary_objective" do
    assert_difference("GamesSecondaryObjective.count") do
      post games_secondary_objectives_url, params: { games_secondary_objective: { game_id: @games_secondary_objective.game_id, player_id: @games_secondary_objective.player_id, secondary_objective_id: @games_secondary_objective.secondary_objective_id } }
    end

    assert_redirected_to games_secondary_objective_url(GamesSecondaryObjective.last)
  end

  test "should show games_secondary_objective" do
    get games_secondary_objective_url(@games_secondary_objective)
    assert_response :success
  end

  test "should get edit" do
    get edit_games_secondary_objective_url(@games_secondary_objective)
    assert_response :success
  end

  test "should update games_secondary_objective" do
    patch games_secondary_objective_url(@games_secondary_objective), params: { games_secondary_objective: { game_id: @games_secondary_objective.game_id, player_id: @games_secondary_objective.player_id, secondary_objective_id: @games_secondary_objective.secondary_objective_id } }
    assert_redirected_to games_secondary_objective_url(@games_secondary_objective)
  end

  test "should destroy games_secondary_objective" do
    assert_difference("GamesSecondaryObjective.count", -1) do
      delete games_secondary_objective_url(@games_secondary_objective)
    end

    assert_redirected_to games_secondary_objectives_url
  end
end
