require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }

    it { is_expected.to have_many(:todos).dependent(:destroy) }
  end

  describe 'columns' do
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false, index: true) }
  end

  describe 'validations' do
    subject { create(:project) }

    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:user_id) }
  end
end
