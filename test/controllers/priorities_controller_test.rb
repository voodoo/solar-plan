require 'test_helper'

class PrioritiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @priority = priorities(:one)
  end

  test "should get index" do
    get priorities_url
    assert_response :success
  end

  test "should get new" do
    get new_priority_url
    assert_response :success
  end

  test "should create priority" do
    assert_difference('Priority.count') do
      post priorities_url, params: { priority: { name: @priority.name } }
    end

    assert_redirected_to priority_path(Priority.last)
  end

  test "should show priority" do
    get priority_url(@priority)
    assert_response :success
  end

  test "should get edit" do
    get edit_priority_url(@priority)
    assert_response :success
  end

  test "should update priority" do
    patch priority_url(@priority), params: { priority: { name: @priority.name } }
    assert_redirected_to priority_path(@priority)
  end

  test "should destroy priority" do
    assert_difference('Priority.count', -1) do
      delete priority_url(@priority)
    end

    assert_redirected_to priorities_path
  end
end
