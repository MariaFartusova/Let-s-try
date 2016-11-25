require 'rails_helper'
describe "Question pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }
  describe "question destruction" do
    before { FactoryGirl.create(:question, user: user) }
    describe "as correct user" do
      before { visit root_path }
    end
  end

  describe "question creation" do
    before { visit root_path }
    describe "with invalid information" do
      describe "error messages" do
        before { click_button "Post" }
      end
    end

    describe "with valid information" do
      before { fill_in 'question_content', with: "Lorem ipsum" }
      it "should create a question" do
        expect { click_button "Post" }.to change(question, :count).by(1)
      end
    end
  end
end