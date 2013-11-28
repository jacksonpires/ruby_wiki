require 'spec_helper'

describe 'Pages versions', type: :feature, js: true, versioning: true do
  before do
    find_or_create_a_wiki_detail
    find_or_create_user
    authenticate
  end

  it 'shows all the versions of a page' do
    _page = create :page, title: 'Game Thrones', body: 'old body content', slug: 'tv_series/game_of_thrones'
    _page.update(title: 'Game of Thrones', body: 'new body content')

    visit '/pages/tv_series/game_of_thrones/versions'

    expect(page).to have_content('Game Thrones')
    expect(page).to_not have_content('old body conten')

    find("a[href='##{_page.updated_at.to_i}_modal']").click
    expect(page).to have_content('old body conten')
  end

  it 'shows empty then some body has no content' do
    _page = create :page, title: 'Game Thrones', body: '', slug: 'tv_series/game_of_thrones'
    _page.update(title: 'Game of Thrones', body: 'new body content')

    visit '/pages/tv_series/game_of_thrones/versions'

    find("a[href='##{_page.updated_at.to_i}_modal']").click
    expect(page).to have_content('(empty)')
  end
end
