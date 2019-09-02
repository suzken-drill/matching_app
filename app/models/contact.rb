class Contact < ApplicationRecord
  before_create :set_user_ip

  validates :name, presence: {message: I18n.t(:form_name_error, scope: [:message, :contact_form])}
  validates :email, presence: {message: I18n.t(:form_email_error, scope: [:message, :contact_form])}, length: {maximum: 255, message: I18n.t(:form_email_length_error, scope: [:message, :contact_form])}, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: I18n.t(:form_email_format_error, scope: [:message, :contact_form])}
  validates :message, presence: {message: I18n.t(:form_message_error, scope: [:message, :contact_form])}

  private
    def set_user_ip
      self.user_ip = Thread.current[:request].remote_ip if self.user_ip.blank?
    end
end
