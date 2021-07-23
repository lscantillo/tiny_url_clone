# == Schema Information
#
# Table name: ips
#
#  id         :bigint           not null, primary key
#  ip         :string
#  url_id     :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Ip, type: :model do
  context 'valid factory' do
    it { expect(FactoryBot.build(:ip)).to be_valid }
  end
  describe 'Associations' do
    it { should belong_to(:url) }
  end
  describe 'Validations' do
    it { should validate_presence_of(:ip) }
  end
end
