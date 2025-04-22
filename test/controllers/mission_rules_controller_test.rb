require "test_helper"

class MissionRulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mission_rule = mission_rules(:one)
  end

  test "should get index" do
    get mission_rules_url
    assert_response :success
  end

  test "should get new" do
    get new_mission_rule_url
    assert_response :success
  end

  test "should create mission_rule" do
    assert_difference("MissionRule.count") do
      post mission_rules_url, params: { mission_rule: { description: @mission_rule.description, name: @mission_rule.name } }
    end

    assert_redirected_to mission_rule_url(MissionRule.last)
  end

  test "should show mission_rule" do
    get mission_rule_url(@mission_rule)
    assert_response :success
  end

  test "should get edit" do
    get edit_mission_rule_url(@mission_rule)
    assert_response :success
  end

  test "should update mission_rule" do
    patch mission_rule_url(@mission_rule), params: { mission_rule: { description: @mission_rule.description, name: @mission_rule.name } }
    assert_redirected_to mission_rule_url(@mission_rule)
  end

  test "should destroy mission_rule" do
    assert_difference("MissionRule.count", -1) do
      delete mission_rule_url(@mission_rule)
    end

    assert_redirected_to mission_rules_url
  end
end
