require 'rails_com'
module RailsMed
  class Engine < ::Rails::Engine

    config.autoload_paths += Dir[
      "#{config.root}/app/models/cause",
      "#{config.root}/app/models/treat",
      "#{config.root}/app/models/symptom"
    ]

  end
end
