require 'elasticsearch/model'

class Chapter < ActiveRecord::Base
  include Elasticsearch::Model
  belongs_to :work
  has_attached_file :body_image, default_url: "/images/:style/missing.png"
  has_attached_file :body_audio
  validates_attachment_content_type :body_image, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :body_audio, :content_type => [ 'audio/octet-stream', 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]
end
