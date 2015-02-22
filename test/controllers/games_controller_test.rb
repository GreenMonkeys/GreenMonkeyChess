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

    test "create not signed in" do
    	assert_no_difference 'Game.count' do
    		post :create, {:game => {
    			:name => 'tough game'
    			}
    		}
    	end
    	assert_redirected_to new_user_session_path
    end

#  test "create" do
#    user = FactoryGirl.create(:user)
#    sign_in user

#    assert_difference 'Place.count' do
#      post :create, {:game => {
 #         :name => 'Tough game.'
#        }
#      }
#    end
#    assert_redirected_to games_path
#
 #   assert_equal 1, user.games.count
 # end

end
