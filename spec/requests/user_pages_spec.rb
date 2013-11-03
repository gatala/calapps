require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit @user }

    it { should have_content(@user.name) }
    it { should have_title(@user.name) }
  end

end