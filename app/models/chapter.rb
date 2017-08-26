require 'elasticsearch/model'

class Chapter < ActiveRecord::Base
  include Elasticsearch::Model
  belongs_to :work
  has_attached_file :body_image, default_url: "/images/:style/missing.png"
  has_attached_file :body_audio
  validates_attachment_content_type :body_image, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :body_audio, content_type: /\Aaudio\/.*\z/
end
