require 'work_config'

WorkConfig.config = YAML.load_file("config/work.yml")[Rails.env].stringify_keys
