require 'test_helper'

class Admin::TextEffectsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_text_effects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create text_effect" do
    assert_difference('Admin::TextEffect.count') do
      post :create, :text_effect => { }
    end

    assert_redirected_to text_effect_path(assigns(:text_effect))
  end

  test "should show text_effect" do
    get :show, :id => admin_text_effects(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => admin_text_effects(:one).to_param
    assert_response :success
  end

  test "should update text_effect" do
    put :update, :id => admin_text_effects(:one).to_param, :text_effect => { }
    assert_redirected_to text_effect_path(assigns(:text_effect))
  end

  test "should destroy text_effect" do
    assert_difference('Admin::TextEffect.count', -1) do
      delete :destroy, :id => admin_text_effects(:one).to_param
    end

    assert_redirected_to admin_text_effects_path
  end
end
