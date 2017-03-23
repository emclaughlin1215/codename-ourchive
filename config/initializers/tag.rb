require 'tag_config'

TagConfig.config = YAML.load_file("config/tag.yml")[Rails.env].stringify_keys
