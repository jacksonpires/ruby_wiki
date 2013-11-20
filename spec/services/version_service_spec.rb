require 'spec_helper'

describe VersionService, versioning: true do
  let(:_page) { double }
  let(:version) { double }
  let(:versions) { [version] }
  let(:user) { { email: 'example@email.com' } }

  subject { described_class.new(_page) }

  before do
    _page.stub(:versions).and_return(versions)
    User.stub(:find).with(123).and_return(user)
  end

  describe '#versions' do
    context 'when version whodunnit is present' do
      before { version.stub(:whodunnit).and_return(123) }

      context 'when version object is present' do
        before { version.stub(:object) { "---\n:title: old title\n:body: old body\n" } }

        it 'returns a hash' do
          expect(subject.versions).to eql([
            { user: { email: 'example@email.com' }, title: 'old title', body: 'old body' }
          ])
        end
      end

      context 'when version object is not present' do
        before { version.stub(:object) }

        it 'returns a hash' do
          expect(subject.versions).to eql([{ user: { email: 'example@email.com' } }])
        end
      end
    end

    context 'when version whodunnit is not present' do
      before { version.stub(:whodunnit) }

      context 'when version object is present' do
        before { version.stub(:object) { "---\n:title: old title\n:body: old body\n" } }

        it 'returns a hash' do
          expect(subject.versions).to eql([{ title: 'old title', body: 'old body' }])
        end
      end

      context 'when version object is not present' do
        before { version.stub(:object) }

        it 'returns a hash' do
          expect(subject.versions).to eql([{}])
        end
      end
    end
  end
end
