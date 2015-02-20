require 'test_helper'

class GamesControllerTest < ActionController::TestCase
   #test "the truth" do
   #  assert true
   #end

	test "index" do
	  FactoryGirl.create(:game)
	  get :index
	  assert_response :success
    end
end
