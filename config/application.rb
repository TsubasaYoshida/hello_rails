require_relative 'boot'

require "rails"

require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module HelloRails
  class Application < Rails::Application
    config.load_defaults 5.2

    config.generators.system_tests = nil

    config.generators do |g|
      g.test_framework :rspec,
                       # テストデータベースにレコードを作成するファイルの作成をスキップ
                       fixtures: false,
                       # ビュースペックの作成をスキップ(UIのテストはフィーチャスペックに任せる)
                       view_specs: false,
                       # ヘルパースペックの作成をスキップ
                       helper_specs: false,
                       # ルーティングスペックの作成をスキップ
                       routing_specs: false
    end
  end
end
