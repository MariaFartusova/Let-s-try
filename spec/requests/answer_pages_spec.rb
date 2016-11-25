
require 'spec_helper'

describe "Answer pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }
  describe "answer destruction" do
    before { FactoryGirl.create(:answer, user: user) }
    describe "as correct user" do
      before { visit root_path }
    end
  end

  describe "answer creation" do
    before { visit root_path }
    describe "with invalid information" do
      describe "error messages" do
        before { click_button "Post" }
      end
    end

    describe "with valid information" do
      before { fill_in 'answer_content', with: "Lorem ipsum" }
      it "should create a answer" do
        expect { click_button "Post" }.to change(answer, :count).by(1)
      end
    end
  end
end