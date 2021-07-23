# == Schema Information
#
# Table name: urls
#
#  id          :bigint           not null, primary key
#  url         :text
#  token       :text
#  visit_count :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  domain      :string
#
require 'rails_helper'

RSpec.describe Url, type: :model do
  context 'valid factory' do
    it { expect(FactoryBot.build(:url)).to be_valid }
  end

  describe 'Associations' do
    it { should have_many(:ips) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:token) }
    it { should validate_presence_of(:domain) }
  end
end
