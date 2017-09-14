require 'test_helper'

class ExspensesControllerTest < ActionController::TestCase
  setup do
    @exspense = exspenses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exspenses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exspense" do
    assert_difference('Exspense.count') do
      post :create, exspense: { cost: @exspense.cost, name: @exspense.name }
    end

    assert_redirected_to exspense_path(assigns(:exspense))
  end

  test "should show exspense" do
    get :show, id: @exspense
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exspense
    assert_response :success
  end

  test "should update exspense" do
    patch :update, id: @exspense, exspense: { cost: @exspense.cost, name: @exspense.name }
    assert_redirected_to exspense_path(assigns(:exspense))
  end

  test "should destroy exspense" do
    assert_difference('Exspense.count', -1) do
      delete :destroy, id: @exspense
    end

    assert_redirected_to exspenses_path
  end
end
