class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  # サーバ内(ローカル)に保存する
  storage :file

  # 保存する際の拡張子
  process :convert => 'jpg'

  # Rails.root/public/uploads/...に保存する
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # 保存する際のファイル名の規則
  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  # サムネイル用サイズ
  version :thumb do
    process :resize_to_limit => [320, 320]
  end

  # ファイルサイズをバリデーションする
  def size_range
    1..5.megabytes
  end

  # 許可する拡張子
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  protected

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end

end