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
FactoryBot.define do
  factory :url do
    url { Faker::Internet.url }
    token { SecureRandom.hex(4) }
    domain { "#{ENV['HOSTNAME']}/#{token}" }
    visit_count { 0 }
  end
end
