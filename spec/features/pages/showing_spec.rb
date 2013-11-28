require 'spec_helper'

describe 'Pages showing', type: :feature do
  before do
    find_or_create_a_wiki_detail
    find_or_create_user
    authenticate
  end

  let!(:_page) { create :page, title: 'Homeland', slug: 'tv_series/homeland',
    body: "A CIA officer who is put on probation and reassigned to the CIA's Counterterrorism Center." }

  context 'accessing a page from the list' do
    it 'shows the correct body' do
      visit pages_path
      click_link 'Homeland'

      expect(current_path).to eql('/pages/tv_series/homeland')
      expect(page).to have_content(_page.body)
      expect(page).to have_content("Last edited by #{_page.updated_by}, less than a minute ago")
    end
  end

  context 'accessing a page directly' do
    it 'shows the correct body' do
      visit '/pages/tv_series/homeland'

      expect(current_path).to eql('/pages/tv_series/homeland')
      expect(page).to have_content(_page.body)
      expect(page).to have_content("Last edited by #{_page.updated_by}, less than a minute ago")
    end
  end
end
