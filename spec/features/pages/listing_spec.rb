require 'spec_helper'

describe 'Pages listing', type: :feature do
  let!(:pages) { create_list :page, 5 }

  it 'shows all pages' do
    visit pages_path

    pages.each do |_page|
      expect(page).to have_content(_page.title)
    end
  end
end
