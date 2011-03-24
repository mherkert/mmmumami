require 'spec_helper'

describe Cookbook do

  before(:each) do
    @user = Factory(:user)
    @attr = { :title => "value for content", :description => "value for description" }
  end

  it "should create a new instance given valid attributes" do
    @user.cookbooks.create!(@attr)
  end

  describe "user associations" do

    before(:each) do
      @cookbook = @user.cookbooks.create(@attr)
    end

    it "should have a user attribute" do
      @cookbook.should respond_to(:user)
    end

    it "should have the right associated user" do
      @cookbook.user_id.should == @user.id
      @cookbook.user.should == @user
    end
  end
  
  describe "validations" do

    it "should require a user id" do
      Cookbook.new(@attr).should_not be_valid
    end

    it "should require nonblank content" do
      @user.cookbooks.build(:title => "  ").should_not be_valid
    end

    it "should reject long content" do
      @user.cookbooks.build(:title => "a" * 33).should_not be_valid
    end
  end
  
  describe "recipe associations" do
     
    before(:each) do
      @cookbook = Factory(:cookbook, :user => @user)
      @r1 = Factory(:recipe, :user => @user, :cookbook => @cookbook, :created_at => 2.days.ago)
      @r2 = Factory(:recipe, :user => @user, :cookbook => @cookbook, :created_at => 1.week.ago)
    end
    
    it "should have a recipes attribute" do
      @cookbook.should respond_to(:recipes)
    end
  end
end