require 'test_helper'

class McropostsControllerTest < ActionController::TestCase
  setup do
    @mcropost = mcroposts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mcroposts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mcropost" do
    assert_difference('Mcropost.count') do
      post :create, :mcropost => @mcropost.attributes
    end

    assert_redirected_to mcropost_path(assigns(:mcropost))
  end

  test "should show mcropost" do
    get :show, :id => @mcropost.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mcropost.to_param
    assert_response :success
  end

  test "should update mcropost" do
    put :update, :id => @mcropost.to_param, :mcropost => @mcropost.attributes
    assert_redirected_to mcropost_path(assigns(:mcropost))
  end

  test "should destroy mcropost" do
    assert_difference('Mcropost.count', -1) do
      delete :destroy, :id => @mcropost.to_param
    end

    assert_redirected_to mcroposts_path
  end
end
