require 'rails_helper'

describe "Authentication" do
	
	subject {page}

	describe "signin page" do
		before {visit signin_path}

		it {expect(subject).to have_title('Sign in')}
		it {expect(subject).to have_selector('h1', text: 'Sign in')}

		describe "with invalid information" do
			before {click_button "Sign in"}

			it {expect(subject).to have_title('Sign in')}
		end

		describe "with valid information" do
			let(:user) { FactoryGirl.create(:user) }
			before do
				fill_in "Email", with: user.email
				fill_in "Password", with: user.password
				click_button "Sign in"
			end

			it {expect(subject).to have_title(user.name)}
			it {expect(subject).to have_link('Profile', href: user_path(user))}
			it {expect(subject).to have_link('Sign out', href: signout_path)}
			it {expect(subject).not_to have_link('Sign in', href: signin_path)}
		end
	end
end
