class Work < ActiveRecord::Base
  belongs_to :user
  has_many :chapters
end
