require 'test_helper'

class TrashesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trashes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trash" do
    assert_difference('Trash.count') do
      post :create, :trash => { }
    end

    assert_redirected_to trash_path(assigns(:trash))
  end

  test "should show trash" do
    get :show, :id => trashes(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => trashes(:one).id
    assert_response :success
  end

  test "should update trash" do
    put :update, :id => trashes(:one).id, :trash => { }
    assert_redirected_to trash_path(assigns(:trash))
  end

  test "should destroy trash" do
    assert_difference('Trash.count', -1) do
      delete :destroy, :id => trashes(:one).id
    end

    assert_redirected_to trashes_path
  end
end
