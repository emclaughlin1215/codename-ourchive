require 'temp_config'

TempConfig.config = YAML.load_file("config/temp.yml")[Rails.env].stringify_keys