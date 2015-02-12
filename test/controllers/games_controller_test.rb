require 'test_helper'

class GamesControllerTest < ActionController::TestCase
 #  test "the truth" do
  #   assert true
   #end

	test "no one is logged in- new" do
		get :new
		assert_redirected_to new_user_session_path
	end

	test "someone is logged in- new" do
		user = FactoryGirl.create(:user)
		sign_in user
		get :new
		assert_response :success
	end

	test "index" do
		FactoryGirl.create(:game)
		get :index
		assert_response :success
	end


end
