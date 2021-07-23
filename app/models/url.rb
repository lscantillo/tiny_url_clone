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
class Url < ApplicationRecord
  include Countable
  has_many :ips
  validates :url, :token, :domain, presence: true
  before_validation :add_protocol_to_url


  # Method to add https protocol
  def add_protocol_to_url
    unless self.url.blank?
      self.url.slice!(/http:\/\/|https:\/\//)
      self.url = "https://#{self.url}"
    end
  end
  
end
