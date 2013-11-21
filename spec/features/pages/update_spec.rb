require 'spec_helper'

describe 'Pages update', type: :feature do
  before do
    find_or_create_user
    authenticate
  end

  let!(:_page) { create :page, title: 'Big Bang', slug: 'tv_series/the_big_bang_theory' }

  it 'updates a page' do
    visit '/pages/tv_series/the_big_bang_theory/edit'
    fill_in 'Title', with: 'The Big Bang Theory'
    body = 'Brilliant but socially awkward physicists trying to learn about life outside of the laboratory.'
    fill_in 'Body', with: body
    click_button 'Save'

    expect(current_path).to eql('/pages/tv_series/the_big_bang_theory')
    expect(_page.reload.title).to eql('The Big Bang Theory')
    expect(_page.body).to eql(body)
    expect(_page.slug).to eql('tv_series/the_big_bang_theory')
  end
end
