class Tag < ActiveRecord::Base
  searchkick word_start: [:text]
  has_many :work_tags
  has_many :works, through: :work_tags
end
