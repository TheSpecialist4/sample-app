require 'rails_helper'
#require 'spec_helper'

describe "Static Pages" do
	describe "Home Page" do
		it "should have sample app" do
			visit '/static_pages/home'
			expect(page).to have_content('Home')
		end
		it "should have the right title" do
			visit '/static_pages/home'
			expect(page).to have_title('Ruby on Rails Sample App | Home')
		end
	end

	describe "About Us" do
		it "should have about us" do
			visit '/static_pages/about'
			expect(page).to have_content('About Us')
		end
		it "should have right title" do
			visit '/static_pages/about'
			expect(page).to have_title('Ruby on Rails Sample App | About Us')
		end
	end
end