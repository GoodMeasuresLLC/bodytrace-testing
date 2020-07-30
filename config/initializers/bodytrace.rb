BODYTRACE_CONFIG = YAML.load(ERB.new(File.new("config/bodytrace.yml").read).result)[Rails.env]
