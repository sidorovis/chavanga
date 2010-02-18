require 'test_helper'

class ImageGalleryImagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:image_gallery_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create image_gallery_image" do
    assert_difference('ImageGalleryImage.count') do
      post :create, :image_gallery_image => { }
    end

    assert_redirected_to image_gallery_image_path(assigns(:image_gallery_image))
  end

  test "should show image_gallery_image" do
    get :show, :id => image_gallery_images(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => image_gallery_images(:one).to_param
    assert_response :success
  end

  test "should update image_gallery_image" do
    put :update, :id => image_gallery_images(:one).to_param, :image_gallery_image => { }
    assert_redirected_to image_gallery_image_path(assigns(:image_gallery_image))
  end

  test "should destroy image_gallery_image" do
    assert_difference('ImageGalleryImage.count', -1) do
      delete :destroy, :id => image_gallery_images(:one).to_param
    end

    assert_redirected_to image_gallery_images_path
  end
end
