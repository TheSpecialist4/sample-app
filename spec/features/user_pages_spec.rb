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

		let(:submit) { "Create my account" }
		describe "with invalid information" do
			it "should not create the user account" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "Name", with: "Naruto Uzumaki"
				fill_in "Email", with: "naruto@rasengan.com"
				fill_in "Password", with: "foobar"
				fill_in "Confirmation", with: "foobar"
			end

			it "should create new user" do
				expect do
					click_button submit
				end.to change(User, :count).by(1)
			end
		end
	end

	describe "profile page" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }

		it { expect(page).to have_selector('h1', text: user.name) }
		it { expect(page).to have_title(text: user.name) }
	end
end
