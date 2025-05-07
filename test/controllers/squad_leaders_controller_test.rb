require "test_helper"

class SquadLeadersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @squad_leader = squad_leaders(:one)
  end

  test "should get index" do
    get squad_leaders_url
    assert_response :success
  end

  test "should get new" do
    get new_squad_leader_url
    assert_response :success
  end

  test "should create squad_leader" do
    assert_difference("SquadLeader.count") do
      post squad_leaders_url, params: { squad_leader: { leader_id: @squad_leader.leader_id, squad_id: @squad_leader.squad_id } }
    end

    assert_redirected_to squad_leader_url(SquadLeader.last)
  end

  test "should show squad_leader" do
    get squad_leader_url(@squad_leader)
    assert_response :success
  end

  test "should get edit" do
    get edit_squad_leader_url(@squad_leader)
    assert_response :success
  end

  test "should update squad_leader" do
    patch squad_leader_url(@squad_leader), params: { squad_leader: { leader_id: @squad_leader.leader_id, squad_id: @squad_leader.squad_id } }
    assert_redirected_to squad_leader_url(@squad_leader)
  end

  test "should destroy squad_leader" do
    assert_difference("SquadLeader.count", -1) do
      delete squad_leader_url(@squad_leader)
    end

    assert_redirected_to squad_leaders_url
  end
end
