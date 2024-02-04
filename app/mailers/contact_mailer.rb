class ContactMailer < ApplicationMailer
  def send_mail(contact)
    @contact = contact
    mail to:   ENV.fetch('GMAIL_ADDRESS', nil), subject: '【お問い合わせ】' + @contact.subject
  end
end
