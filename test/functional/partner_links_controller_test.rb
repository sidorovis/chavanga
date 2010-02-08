require 'test_helper'

class PartnerLinksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:partner_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create partner_link" do
    assert_difference('PartnerLink.count') do
      post :create, :partner_link => { }
    end

    assert_redirected_to partner_link_path(assigns(:partner_link))
  end

  test "should show partner_link" do
    get :show, :id => partner_links(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => partner_links(:one).to_param
    assert_response :success
  end

  test "should update partner_link" do
    put :update, :id => partner_links(:one).to_param, :partner_link => { }
    assert_redirected_to partner_link_path(assigns(:partner_link))
  end

  test "should destroy partner_link" do
    assert_difference('PartnerLink.count', -1) do
      delete :destroy, :id => partner_links(:one).to_param
    end

    assert_redirected_to partner_links_path
  end
end
