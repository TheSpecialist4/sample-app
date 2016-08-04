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
		let!(:m1) {FactoryGirl.create(:micropost, user: user, content: "foobar")}
		let!(:m2) {FactoryGirl.create(:micropost, user: user, content: "foobazz")}
		before { visit user_path(user) }

		it { expect(page).to have_selector('h1', text: user.name) }
		#it { expect(page).to have_title(text: user.name + " | Profile") }

		describe "microposts" do
			it { expect(page).to have_content(m1.content) }
			it { expect(page).to have_content(m2.content) }
			it { expect(page).to have_content(user.microposts.count) }
		end
	end

	describe "edit" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit edit_user_path(user) }

		describe "with valid information" do
			let(:new_name) { "New name" }
			let(:new_email) {"new@email.com"}
			before do
				fill_in "Name", with: new_name
				fill_in "Email", with: new_email
				fill_in "Password", with: user.password
				fill_in "Password confirmation", with: user.password
				click_button "Save changes"
			end

			specify { expect(user.reload.name).to eq(new_name) }
		end
	end
end
