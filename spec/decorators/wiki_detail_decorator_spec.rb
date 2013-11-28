require 'spec_helper'

describe WikiDetailDecorator do
  describe '#logo_or_name' do
    context 'when logo is present' do
      it 'returns a link to root with the logo' do
        wiki_detail = build(:wiki_detail).decorate
        expected_link = /<a href="\/"><img alt="Rails" src="\/system\/wiki_details\/logos\/\/small\/rails\.png\?\d+" \/><\/a>/

        expect(wiki_detail.logo_or_name).to match(expected_link)
      end
    end

    context 'when logo is not present' do
      it 'returns a link to root with the name' do
        wiki_detail = build(:wiki_detail, logo: nil).decorate
        expected_link = "<a href=\"/\"><h1>#{wiki_detail.name}</h1></a>"

        expect(wiki_detail.logo_or_name).to eql(expected_link)
      end
    end
  end
end
