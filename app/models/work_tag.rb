class WorkTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :work
end
