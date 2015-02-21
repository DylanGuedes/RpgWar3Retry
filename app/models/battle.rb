class Battle < ActiveRecord::Base  
  belongs_to :starter
  belongs_to :target
end
