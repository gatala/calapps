require "spec_helper"

 
describe User do
  before(:each) do
    @attr = {
      :name => 'Billy Joe Bob',
      :email => 'foobar@foo.com',
      :password => '12341234',
      :password_confirmation => '12341234'
    }
    # Active ActionMailer for tests
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
  end
 
  it "should create a new instance given a valid attribute" do
    User.create!(@attr)
  end
 
  it "should send an email after create a new instance given a valid attribute" do
    User.create!(@attr)
    ActionMailer::Base.deliveries.count == 1
  end
 
end