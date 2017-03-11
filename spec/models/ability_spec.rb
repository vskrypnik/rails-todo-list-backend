require 'rails_helper'

RSpec.describe Ability, type: :model do
  describe 'guest' do
    subject { Ability.new nil }

    describe 'Project' do
      %i(read create update destroy).each do |ability|
        it { is_expected.not_to be_able_to ability, Project }
      end
    end

    describe 'Todo' do
      %i(read create update destroy).each do |ability|
        it { is_expected.not_to be_able_to ability, Todo }
      end
    end
  end

  describe 'user' do
    let(:user) { create :user }

    subject { Ability.new user }

    describe 'Project' do
      %i(read create update destroy).each do |ability|
        it { is_expected.not_to be_able_to ability, create(:project) }
        it { is_expected.to be_able_to ability, create(:project, user: user) }
      end
    end

    describe 'Todo' do
      let(:another_user_project) { create(:project) }
      let(:current_user_project) { create(:project, user: user) }

      let(:current_user_todo) { create(:todo, project: current_user_project) }
      let(:another_user_todo) { create(:todo, project: another_user_project) }

      %i(read create update destroy).each do |ability|
        it { is_expected.to be_able_to ability, current_user_todo }
        it { is_expected.not_to be_able_to ability, another_user_todo }
      end
    end
  end
end
