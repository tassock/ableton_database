require 'test_helper'

class LibraryClipsControllerTest < ActionController::TestCase
  setup do
    @library_clip = library_clips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:library_clips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create library_clip" do
    assert_difference('LibraryClip.count') do
      post :create, :library_clip => @library_clip.attributes
    end

    assert_redirected_to library_clip_path(assigns(:library_clip))
  end

  test "should show library_clip" do
    get :show, :id => @library_clip.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @library_clip.to_param
    assert_response :success
  end

  test "should update library_clip" do
    put :update, :id => @library_clip.to_param, :library_clip => @library_clip.attributes
    assert_redirected_to library_clip_path(assigns(:library_clip))
  end

  test "should destroy library_clip" do
    assert_difference('LibraryClip.count', -1) do
      delete :destroy, :id => @library_clip.to_param
    end

    assert_redirected_to library_clips_path
  end
end
