require 'rails_helper'

describe Book do
  specify { is_expected.to validate_presence_of(:title) }
  specify { is_expected.to validate_presence_of(:preview) }
  specify { is_expected.to validate_presence_of(:description) }
  specify { is_expected.to validate_presence_of(:author) }
  specify { is_expected.to validate_presence_of(:publisher) }
  specify { is_expected.to validate_presence_of(:year) }
  specify { is_expected.to validate_uniqueness_of(:title) }
  specify { is_expected.to validate_length_of(:title).is_at_most(255) }
  specify { is_expected.to validate_length_of(:author).is_at_most(50) }

  context 'publisher' do
    let(:valid_book) { build :book }
    let(:invalid_book) { build :book, publisher: Faker::Book.publisher }

    specify { expect(valid_book).to be_valid }
    specify { expect(invalid_book).to be_invalid }
  end

  context 'year' do
    let(:valid_book) { build :book }
    let(:old_book) { build :book, year: Time.zone.now.year - 200 - SecureRandom.random_number(100) }
    let(:future_book) { build :book, year: Time.zone.now.year + 1 + SecureRandom.random_number(50) }

    specify { expect(valid_book).to be_valid }
    specify { expect(old_book).to be_invalid }
    specify { expect(future_book).to be_invalid }
  end
end
