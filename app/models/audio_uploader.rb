class AudioUploader < Shrine
	plugin :validation_helpers

  	Attacher.validate do
    	validate_max_size 500*1024*1024, message: "is too large (max is 500 MB)"
    	validate_mime_type_inclusion %w[audio/octet-stream audio/mpeg audio/x-mpeg audio/mp3 audio/x-mp3 audio/mpeg3 audio/x-mpeg3 audio/mpg audio/x-mpg audio/x-mpegaudio]
  	end
end