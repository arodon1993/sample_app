require 'spec_helper'

describe User do
  
	before do
		@user=User.new(name: "Example User", 
					   email: "user@example.com",
					   password: "example",
					   password_confirmation: "example")
	end

	subject { @user } 

	it { should respond_to(:name) }
	it { should respond_to(:email) } 
	it { should respond_to(:password_digest) } 
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation)}

	it { should be_valid }

	describe "when data are blank" do
		before { @user = User.new(name: "") }
		it { should_not be_valid } 
	end

	describe "when email is blank" do
		before { @user = User.new(email: "") }
		it { should_not be_valid } 
	end

	describe "when name is too long" do
		before { @user.name = 'a'*51 }
		it { should_not be_valid } 
	end

   	describe "when email is invalid" do
   		it "should be invalid" do 
			emails = %w[user@foo,com user_at_foo.org example.user@foo.
	                     foo@bar_baz.com foo@bar+baz.com]

	        emails.each do |e|
	        	@user.email = e
	        	expect(@user).not_to be_valid
	        end
	    end
   	end

   	describe "when email is valid" do
   		it "should be valid" do
	   		emails = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]

	   		emails.each do |e|
	   			@user.email = e
	   			expect(@user).to be_valid
	   		end
	   	end
   	end

   	describe "when email is not unique" do

   		before do
   			duplicated_email = @user.dup
   			duplicated_email.email = @user.email.upcase
   			duplicated_email.save
   		end

   		it { should_not be_valid }
   	end

   	describe "when password is not present" do

   		before do
   			@user = User.new(name: "example", email: "user@example.com",
   				password: " ", password_confirmation: " ")
   		end
   		it { should_not be_valid }

   	end

   	describe "when email doesn't match with confirmation" do

   		before do
   			@user.password_confirmation = "wrong password"
   		end
   		it { should_not be_valid } 
   	end

   	describe "password is too short" do
   		before { @user.password = @user.password_confirmation = 'a'*5 }
   		it { should_not be_valid }
   	end

   	describe "return value of authentication method" do
   		before { @user.save }
   		let(:found_user) { User.find_by(email: @user.email) } 

   		describe "with valid password" do
   			it { should eq found_user.authenticate(@user.password) }
   		end

   		describe "with invalid password" do
		    let(:user_for_invalid_password) { found_user.authenticate("invalid") }

		    it { should_not eq user_for_invalid_password }
		    specify { expect(user_for_invalid_password).to be_false }
		end

   	end


end
