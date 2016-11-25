require 'rails_helper'

 describe Answer do
    let(:user) { FactoryGirl.create(:user) }
    before { @answer = user.answers.build(content: "Lorem ipsum") }

    subject { @answer }

    it { should respond_to(:content) }
    it { should respond_to(:user_id) }
    it { should respond_to(:user) }
    its(:user) { should eq user }

    it { should be_valid }

    describe "when user_id is not present" do
      before { @answer.user_id = nil }
      it { should_not be_valid }
    end

    describe "with blank content" do
      before { @answer.content = " " }
      it { should_not be_valid }
    end

    describe "with content that is too long" do
      before { @answer.content = "a" * 141 }
      it { should_not be_valid }
    end
  end