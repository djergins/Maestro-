require 'spec_helper'

describe Library do
  let(:user) { FactoryGirl.create(:user) } 
  before { @library = Library.new(name: "Example Library", user_id: user.id) }

  subject { @library }

  it { should respond_to(:name) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when name is not present" do
    before { @library.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @library.name = "a" * 101 }
    it { should_not be_valid }
  end

  describe "when user_id is not present" do
    before { @library.user_id= nil }
    it { should_not be_valid }
  end
end
