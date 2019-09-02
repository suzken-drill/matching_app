class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.send_email.subject
  #
  def send_email(contact)
    @contact = contact

    mail to: @contact.email, subject: "お問い合わせを受け付けました" do |format|
      format.text
    end
  end
  def send_shop_email(shop_contact)
    @shop_contact = shop_contact

    mail to: @shop_contact.email, subject: "お問い合わせを受け付けました" do |format|
      format.text
    end
  end


end
