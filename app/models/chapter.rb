require 'elasticsearch/model'

class Chapter < ActiveRecord::Base
  include Elasticsearch::Model
  belongs_to :work
end
