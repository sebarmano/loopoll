require "rails_helper"

describe QuestionsController do
  describe "GET #index" do
  	context "when the user is logged_in" do
	  	it "responds successfully with an HTTP 200 status code" do
  			@user = create(:user)
  			sign_in @user 
	      get :index
	      expect(response).to be_success
	    end
	  end
	
	  context "when the user is not logged in" do
	  	it "redirects the user to the login screen" do
	  		get :index
	  		expect(response).to be_redirect
	  	end
	  end
	end
end
