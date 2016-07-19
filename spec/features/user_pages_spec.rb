require 'rails_helper'
describe "User pages" do

	describe "signup page" do
		before {visit signup_path}
		
		it "should have heading sign up" do
			expect(page).to have_selector('h1', text: 'Sign Up')
		end
		
		it "should have title sign up" do
			expect(page).to have_title('Ruby on Rails Sample App | Sign Up')
		end
	end
end
