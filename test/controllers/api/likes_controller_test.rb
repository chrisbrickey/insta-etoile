require "test_helper"

class Api::LikesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:testuser)
    @photo = photos(:photo_one)
    @photo_with_like = photos(:photo_two)
  end

  # Helper method to simulate logged-in user
  def login_as(user)
    post "/api/session", params: { user: { username: user.username, password: "password" } }
  end

  test "should create like and return camelCase JSON" do
    login_as(@user)

    assert_difference("Like.count", 1) do
      post "/api/photos/#{@photo.id}/like",
           params: { like: { likable_id: @photo.id, likable_type: "Photo" } }
    end

    assert_response :success

    # Parse JSON response and verify structure/values
    json_response = JSON.parse(response.body)
    assert_like_json_response(json_response, @user.id, @photo.id)
  end

  test "should destroy like and return camelCase JSON" do
    login_as(@user)

    # Photo_two already has a like from testuser (from fixtures)
    assert_difference("Like.count", -1) do
      delete "/api/photos/#{@photo_with_like.id}/like",
             params: { like: { likable_id: @photo_with_like.id, likable_type: "Photo" } }
    end

    assert_response :success

    # Parse JSON response and verify structure/values
    json_response = JSON.parse(response.body)
    assert_like_json_response(json_response, @user.id, @photo_with_like.id)
  end

  test "should not allow duplicate likes" do
    login_as(@user)

    # Create initial like
    post "/api/photos/#{@photo.id}/like",
         params: { like: { likable_id: @photo.id, likable_type: "Photo" } }

    assert_response :success

    # Try to create duplicate like
    assert_no_difference("Like.count") do
      post "/api/photos/#{@photo.id}/like",
           params: { like: { likable_id: @photo.id, likable_type: "Photo" } }
    end

    assert_response 422
  end

  test "should require authentication to create like" do
    # Don't login - test unauthenticated request
    assert_no_difference("Like.count") do
      post "/api/photos/#{@photo.id}/like",
           params: { like: { likable_id: @photo.id, likable_type: "Photo" } }
    end

    # Should redirect to login or return error
    assert_not_equal 200, response.status
  end

  test "should require authentication to destroy like" do
    # Don't login - test unauthenticated request
    assert_no_difference("Like.count") do
      delete "/api/photos/#{@photo_with_like.id}/like",
             params: { like: { likable_id: @photo_with_like.id, likable_type: "Photo" } }
    end

    # Should redirect to login or return error
    assert_not_equal 200, response.status
  end

  private

  def assert_like_json_response(json_response, expected_user_id, expected_likable_id, expected_likable_type = "Photo")
    # Assert camelCase field names (not snake_case) so that jbuilder matches the photo jbuilder pattern
    assert json_response.key?("userId"), "Response should have 'userId' field (camelCase)"
    assert json_response.key?("likableId"), "Response should have 'likableId' field (camelCase)"
    assert json_response.key?("likableType"), "Response should have 'likableType' field (camelCase)"

    # Assert correct values
    assert_equal expected_user_id, json_response["userId"]
    assert_equal expected_likable_id, json_response["likableId"]
    assert_equal expected_likable_type, json_response["likableType"]
  end
end
