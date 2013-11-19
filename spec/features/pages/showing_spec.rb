require 'spec_helper'

describe 'Pages showing', type: :feature do
  let!(:_page) { create :page, title: 'Homeland', slug: 'tv_series/homeland',
    body: "A CIA officer who is put on probation and reassigned to the CIA's Counterterrorism Center." }

  context 'accessing a page from the list' do
    it 'shows the correct body' do
      visit pages_path
      click_link 'Homeland'

      expect(current_path).to eql('/pages/tv_series/homeland')
      expect(page).to have_content(_page.body)
    end
  end

  context 'accessing a page directly' do
    it 'shows the correct body' do
      visit '/pages/tv_series/homeland'

      expect(current_path).to eql('/pages/tv_series/homeland')
      expect(page).to have_content(_page.body)
    end
  end
end
