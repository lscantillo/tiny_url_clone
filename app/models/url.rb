class Url < ApplicationRecord
  include Countable
  has_many :ips
  
end
