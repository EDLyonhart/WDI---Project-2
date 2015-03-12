require 'koala'

Koala.configure do |config|
  config.graph_server = 'http://localhost:3000'
  # other common options are `rest_server` and `dialog_host`
  # see lib/koala/http_service.rb
end