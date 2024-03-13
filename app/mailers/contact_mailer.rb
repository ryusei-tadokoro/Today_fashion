# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  def send_mail(contact)
    @contact = contact
    credentials = Rails.application.credentials
    mail to: credentials.dig(:gmail, :address), subject: "【お問い合わせ】#{@contact.subject}"
  end
end
