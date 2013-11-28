require 'spec_helper'

describe 'Pages layout', type: :feature do
  before { find_or_create_a_wiki_detail }

  context 'when the user is not admin' do
    before do
      find_or_create_user
      authenticate
    end

    it "has the logged user's email" do
      expect(page).to have_content('admin@example.com')
    end

    it 'has the Sign out link' do
      expect(page).to have_content('Sign out')
    end

    it "has no link to Admin area" do
      expect(page).to have_no_content('Admin area')
    end
  end

  context 'when the user is not admin' do
    before do
      find_or_create_user(admin: true)
      authenticate
    end

    it "has link to Admin area" do
      expect(page).to have_content('Admin area')
    end
  end
end
