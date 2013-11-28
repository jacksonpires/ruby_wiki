require 'spec_helper'

describe 'Pages creation', type: :feature do
  before do
    find_or_create_a_wiki_detail
    find_or_create_user
    authenticate
  end

  it 'creates a new page' do
    visit new_page_path
    fill_in 'Title', with: 'Lost'
    body = 'The survivors of a plane crash are forced to live with each other on a remote island.'
    fill_in 'Body', with: body
    click_button 'Save'

    _page = Page.where(title: 'Lost').first

    expect(current_path).to eql('/pages/lost')
    expect(_page.body).to eql(body)
    expect(_page.slug).to eql('lost')
  end

  it 'creates a new page from a unknown path' do
    visit '/pages/tv_series/prison_break'
    expect(page).to have_content('This page does not exist yet.')

    click_link "Create page \"tv_series/prison_break\""

    expect(find('#page_title').value).to eql('Prison Break')

    body = 'Prison Break follows a man, on his mission to break his brother out of prison'

    fill_in 'Body', with: body
    click_button 'Save'

    _page = Page.where(title: 'Prison Break').first

    expect(current_path).to eql('/pages/tv_series/prison_break')
    expect(_page.body).to eql(body)
    expect(_page.slug).to eql('tv_series/prison_break')
  end
end
