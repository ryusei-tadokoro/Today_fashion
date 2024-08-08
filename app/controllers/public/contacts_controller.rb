# frozen_string_literal: true

module Public
  # ContactsController handles the creation and management of contact forms.
  # It includes actions for new contact form, confirming, creating, and showing a confirmation of the submission.
  class ContactsController < ApplicationController
    def new
      @contact = Contact.new
    end

    def confirm
      @contact = Contact.new(contact_params)
      return unless @contact.invalid?

      flash.now[:alert] = @contact.errors.full_messages.join(', ')
      @contact = Contact.new
      render :new
    end

    def back
      @contact = Contact.new(contact_params)
      render :new
    end

    def create
      @contact = Contact.new(contact_params)
      if @contact.save
        ContactMailer.send_mail(@contact).deliver_now
        redirect_to done_public_contacts_path
      else
        flash[:alert] = @contact.errors.full_messages.join(', ')
        @contact = Contact.new
        render :new
      end
    end

    def done; end

    private

    def contact_params
      params.require(:contact).permit(:name, :email, :subject, :message)
    end
  end
end
