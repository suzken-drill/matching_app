class ShopPhoto < ApplicationRecord
  belongs_to :shop

  mount_uploader :filename, ShopPhotosUploader

  # constant
  PHOTO_TYPE_KEYS = %w(main sub)
  PHOTO_TYPE_VALUE_SELECT = [["メイン画像", "main"], ["追加画像", "sub"]]
  REGISTRABLE_ATTRIBUTES = %i(filename photo_type)

  validates :filename, presence: {message: I18n.t(:filename_blank_error, scope: [:message, :shop_photo])}
  validates :photo_type, presence: {message: I18n.t(:photo_type_blank_error, scope: [:message, :shop_photo])}, inclusion: {in: PHOTO_TYPE_KEYS, message: I18n.t(:photo_type_choice_error, scope: [:message, :shop_photo])}

end
