require "test_helper"

class DetachmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @detachment = detachments(:one)
  end

  test "should get index" do
    get detachments_url
    assert_response :success
  end

  test "should get new" do
    get new_detachment_url
    assert_response :success
  end

  test "should create detachment" do
    assert_difference("Detachment.count") do
      post detachments_url, params: { detachment: { army_id: @detachment.army_id, description: @detachment.description, name: @detachment.name } }
    end

    assert_redirected_to detachment_url(Detachment.last)
  end

  test "should show detachment" do
    get detachment_url(@detachment)
    assert_response :success
  end

  test "should get edit" do
    get edit_detachment_url(@detachment)
    assert_response :success
  end

  test "should update detachment" do
    patch detachment_url(@detachment), params: { detachment: { army_id: @detachment.army_id, description: @detachment.description, name: @detachment.name } }
    assert_redirected_to detachment_url(@detachment)
  end

  test "should destroy detachment" do
    assert_difference("Detachment.count", -1) do
      delete detachment_url(@detachment)
    end

    assert_redirected_to detachments_url
  end
end
