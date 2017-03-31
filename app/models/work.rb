class Work < ActiveRecord::Base
  belongs_to :user
  has_many :chapters
  has_many :work_tags
  has_many :tags, :through => :work_tags
end
