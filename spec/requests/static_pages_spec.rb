require 'spec_helper'

describe "Static Pages" do

	describe "Home Page" do
		it "should have content 'Home'" do
			visit 'static_pages/home'
			expect(page).to have_content 'Home'
		end

		it "should have the title 'Home'" do
	      visit '/static_pages/home'
	      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Home")
	    end
	end

	describe "Help Page" do
		it "Should have content 'Help'" do
			visit 'static_pages/help' 
			expect(page).to have_content 'Help'
		end

		it "should have the title 'Help'" do
	      visit '/static_pages/help'
	      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Help")
	    end
	end

	describe "About Page" do
		it "Shoud have content 'About'" do
			visit 'static_pages/about'
			expect(page).to have_content 'About'
		end

		it "should have the title 'About Us'" do
	      visit '/static_pages/about'
	      expect(page).to have_title("Ruby on Rails Tutorial Sample App | About Us")
	    end
	end

end