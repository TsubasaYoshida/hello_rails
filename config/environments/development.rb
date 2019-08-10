Rails.application.configure do

  config.cache_classes = false

  config.eager_load = false

  config.consider_all_requests_local = true

  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
        'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  config.active_storage.service = :local

  config.action_mailer.perform_caching = false

  config.active_support.deprecation = :log

  config.active_record.migration_error = :page_load

  config.active_record.verbose_query_logs = true

  config.assets.debug = true

  config.assets.quiet = true

  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # コメントアウトすることでdevelop環境からメールを送信する設定になる
  # config.action_mailer.raise_delivery_errors = false

  # smtpではなくletter_openerというgemを用いてテストする
  # config.action_mailer.delivery_method = :smtp
  config.action_mailer.delivery_method = :letter_opener

  # viewと違ってURLヘルパーを使ってもドメインが取得できずメール本文にURLを載せられないので、その対策
  config.action_mailer.default_url_options = {:host => 'localhost:3000'}

  config.action_mailer.smtp_settings = {
      :enable_starttls_auto => true,
      :address => 'smtp.gmail.com',
      :port => 587,
      :domain => 'gmail.com',
      :authentication => :plain,
      :user_name => 'tsubasayoshida0624@gmail.com',
      # 本当に飛ばす場合(letter_openerを使わない場合)は、Gmailのアプリパスワードを入れる
      :password => ''
  }

end
