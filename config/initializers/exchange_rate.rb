EXCHANGE_RATES = YAML.load_file("#{Rails.root}/config/exchange_rates.yml")[Rails.env]
