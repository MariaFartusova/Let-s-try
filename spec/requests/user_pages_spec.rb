require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:m1) { FactoryGirl.create(:answer, user: user, content: "Foo") }
    let!(:m2) { FactoryGirl.create(:answer, user: user, content: "Bar") }
    let!(:m1) { FactoryGirl.create(:question, user: user, content: "Foo") }
    let!(:m2) { FactoryGirl.create(:question, user: user, content: "Bar") }
    before { visit user_path(user) }
    it { should have_content(user.name) }

    describe "questions" do
      it { should have_content(m1.content) }
      it { should have_content(user.questions.count) }
    end

    describe "answers" do
      it { should have_content(m1.content) }
    end
  end

  describe "signup page" do
    before { visit '/signup' }
    let(:submit) { "Create my account" }
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end
      
      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }
        it { should have_link('Sign out') }
        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end