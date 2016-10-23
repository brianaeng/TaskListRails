require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "make sure a user can see their tasks" do
    session[:user_id] = users(:ada).id
    get :show, id: tasks(:adas_task).id

    assert_response :success
  end

  test "make sure a user can't see another person's tasks" do
    session[:user_id] = users(:babbage).id
    get :show, id: tasks(:adas_task).id

    assert_response :redirect
    assert_equal flash[:notice], "Access denied."
  end

end
