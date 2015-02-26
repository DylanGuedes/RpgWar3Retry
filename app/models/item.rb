class Item < ActiveRecord::Base
  belongs_to :player
  validates :name, presence: true
  validates :damage, presence: true
  validates :defense, presence: true
  validates :type, presence: true
  validates :player_id, presence: true
end
