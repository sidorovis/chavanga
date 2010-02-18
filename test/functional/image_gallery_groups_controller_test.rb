require 'test_helper'

class ImageGalleryGroupsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:image_gallery_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create image_gallery_group" do
    assert_difference('ImageGalleryGroup.count') do
      post :create, :image_gallery_group => { }
    end

    assert_redirected_to image_gallery_group_path(assigns(:image_gallery_group))
  end

  test "should show image_gallery_group" do
    get :show, :id => image_gallery_groups(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => image_gallery_groups(:one).to_param
    assert_response :success
  end

  test "should update image_gallery_group" do
    put :update, :id => image_gallery_groups(:one).to_param, :image_gallery_group => { }
    assert_redirected_to image_gallery_group_path(assigns(:image_gallery_group))
  end

  test "should destroy image_gallery_group" do
    assert_difference('ImageGalleryGroup.count', -1) do
      delete :destroy, :id => image_gallery_groups(:one).to_param
    end

    assert_redirected_to image_gallery_groups_path
  end
end
