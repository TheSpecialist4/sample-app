require 'rails_helper'

RSpec.describe Micropost, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  before { @micropost = user.microposts.build(content: "jsha dskj") }

  #subject { @micropost }
	it {expect(@micropost).to respond_to(:content)}
	it {expect(@micropost).to respond_to(:user_id)}

	describe "When user id is not present" do
		before {@micropost.user_id = nil}
		it { expect(@micropost).not_to be_valid }
	end
end
