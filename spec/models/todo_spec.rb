require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:project) }
  end

  describe 'columns' do
    it { is_expected.to have_db_column(:deadline).of_type(:date) }
    it { is_expected.to have_db_column(:priority).of_type(:integer) }
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false, index: true) }
    it { is_expected.to have_db_column(:done).of_type(:boolean).with_options(null: false, index: true, default: false) }
  end

  describe 'validations' do
    subject { create(:todo) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:project) }

    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:project_id) }
  end
end
