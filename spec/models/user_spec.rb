require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  before {@user = User.new(name:"Example User", email: "user@example.com",
  					password: "foobar", password_confirmation: "foobar")}

  subject {@user}

  # respond_to? default ruby method -> accepts a symbol
  # and returns true if object responds to given attribute
  it "should respond to name" do
  	expect(subject).to respond_to(:name)
  end

  it "should respond to email" do
  	expect(subject).to respond_to(:email)
  end

  it { expect(subject).to respond_to(:password_digest) }
  it { expect(subject).to respond_to(:password) }

  describe "When password is empty" do
  	before { @user.password = @user.password_confirmation = " " }
  	it { expect(subject).not_to be_valid }
  end

  it { expect(subject).to respond_to(:authenticate) }

  describe "return value of authenticate function" do
  	before { @user.save }
  	# let same as assignment. but let caches value so db called only once
  	let(:found_user) { User.find_by_email(@user.email) }

  	describe "with valid password" do
  		it { expect(subject).to eq(found_user.authenticate(@user.password)) }
  	end

  	describe "invalid password" do
  		let(:user_invalid_pwd) { found_user.authenticate("invalid passworc") }

  		it { expect(subject).not_to eq(user_invalid_pwd) }
  		#specify just a synonym for it
  		specify { expect(user_invalid_pwd).to be false }
  	end
  end

  describe "When password mismatch" do
  	before { @user.password_confirmation = "mismatch pwd" }
  	it { expect(subject).not_to be_valid }
  end

  describe "When name is not present" do
	  before { @user.name = " " }
	  it "blank name should be invalid" do
	  	expect(subject).not_to be_valid
	  end
	end

	describe "When name is too long" do
	  before { @user.name = "a" * 51 }
	  it "long name should be invalid" do
	  	expect(subject).not_to be_valid
	  end
	end

end
