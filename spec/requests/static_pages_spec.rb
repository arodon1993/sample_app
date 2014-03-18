require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for 'All static pages' do
  	it { should have_selector('h1', text: heading) }
  	it { should have_title(full_title(title)) } 
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading) {'Sample'}
    let(:title) {''}

    it { should have_selector('h1', text: 'Sample') }
    it { should have_title(full_title('')) }
  end

  describe "Help page" do
    before { visit help_path }
    let(:heading) {'Help'}
    let(:title) {''}

    it { should have_selector('h1', text: 'Help') }
    it { should have_title(full_title('Help')) }
  end

  describe "About page" do
    before { visit about_path }
    let(:heading) {'About'}
    let(:title) {''}

    it { should have_selector('h1', text: 'About') }
    it { should have_title(full_title('About Us')) }
  end

  describe "Contact page" do
    before { visit contact_path }
    let(:heading) {'Contact'}
    let(:title) {''}

    it { should have_selector('h1', text: 'Contact') }
    it { should have_title(full_title('Contact')) }
  end

  it "should have the right links" do
  	visit root_path
  	click_link "About"
  	expect(page).to have_title(full_title('About Us'))
  	click_link "Contact"
  	expect(page).to have_title(full_title('Contact'))
  	click_link "Help"
  	expect(page).to have_title(full_title('Help')) 
  	click_link "Home"
  	expect(page).to have_title(full_title('Home')) 
  end

end