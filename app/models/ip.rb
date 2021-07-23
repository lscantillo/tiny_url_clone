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
class Ip < ApplicationRecord
  belongs_to :url
  validates :ip, presence: true
end
