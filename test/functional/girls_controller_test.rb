require 'test_helper'

class GirlsControllerTest < ActionController::TestCase
  setup do
    @girl = girls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:girls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create girl" do
    assert_difference('Girl.count') do
      post :create, girl: { birthday: @girl.birthday, blood_type: @girl.blood_type, bwh: @girl.bwh, description: @girl.description, height: @girl.height, hobby: @girl.hobby, name: @girl.name, nationality: @girl.nationality, special_skill: @girl.special_skill }
    end

    assert_redirected_to girl_path(assigns(:girl))
  end

  test "should show girl" do
    get :show, id: @girl
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @girl
    assert_response :success
  end

  test "should update girl" do
    put :update, id: @girl, girl: { birthday: @girl.birthday, blood_type: @girl.blood_type, bwh: @girl.bwh, description: @girl.description, height: @girl.height, hobby: @girl.hobby, name: @girl.name, nationality: @girl.nationality, special_skill: @girl.special_skill }
    assert_redirected_to girl_path(assigns(:girl))
  end

  test "should destroy girl" do
    assert_difference('Girl.count', -1) do
      delete :destroy, id: @girl
    end

    assert_redirected_to girls_path
  end
end
