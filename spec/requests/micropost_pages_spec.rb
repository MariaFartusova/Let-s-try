
require 'spec_helper'

describe "Answer pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }
  describe "answer destruction" do
      before { FactoryGirl.create(:answer, user: user) }

      describe "as correct user" do
        before { visit root_path }

        it "should delete a answer" do
          expect { click_link "delete" }.to change(answer, :count).by(-1)
        end
      end
    end
  describe "answer creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a answer" do
        expect { click_button "Post" }.not_to change(answer, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
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