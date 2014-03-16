require 'spec_helper'

describe "Static Pages" do

	let(:base_title) {"Ruby on Rails Tutorial Sample App |"}

	describe "Home Page" do
		it "should have content 'Home'" do
			visit 'static_pages/home'
			expect(page).to have_content 'Home'
		end

		it "should have the title 'Home'" do
	      visit '/static_pages/home'
	      expect(page).to have_title "#{base_title} Home"
	    end
	end

	describe "Help Page" do
		it "Should have content 'Help'" do
			visit 'static_pages/help' 
			expect(page).to have_content 'Help'
		end

		it "should have the title 'Help'" do
	      visit '/static_pages/help'
	      expect(page).to have_title "#{base_title} Help"
	    end
	end

	describe "About Page" do
		it "Should have content 'About'" do
			visit 'static_pages/about'
			expect(page).to have_content 'About'
		end

		it "should have the title 'About Us'" do
	      visit '/static_pages/about'
	      expect(page).to have_title "#{base_title} About Us"
	    end
	end

	describe "Contact Page" do
		it "Should have content 'Contact'" do
			visit 'static_pages/contact'
			expect(page).to have_content "Contact"
		end

		it "Should have title 'Contact'" do
			visit 'static_pages/contact'
			expect(page).to have_title "#{base_title} Contact"
		end
	end

end