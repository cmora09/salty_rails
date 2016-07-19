class Rant < ActiveRecord::Base
  belongs_to :user
  default_scope -> {order(created_at: :desc}
  validates :user_id, presence: true
  validates :rant, presence: true, length: { maximum: 150 }
  
end
