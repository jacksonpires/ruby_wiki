require 'spec_helper'

describe Page do
  subject { build :page }

  describe 'custom slugs' do
    {
      'breaking bad' => 'breaking_bad',
      'breaking-bad' => 'breaking_bad',
      'breaking.bad' => 'breaking_bad',
      'breaking_bad' => 'breaking_bad',
      'breaking/bad' => 'breaking/bad'
    }.each do |title, expected_slug|
      context "when the title is '#{title}'" do
        it "saves the slug as '#{expected_slug}'" do
          subject.title = title
          subject.save
          expect(subject.slug).to eql(expected_slug)
        end
      end
    end
  end
end
