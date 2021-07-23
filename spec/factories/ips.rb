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
FactoryBot.define do
  factory :ip do
    ip { Faker::Internet.ip_v4_address }
    url { FactoryBot.create(:url) }
  end
end
