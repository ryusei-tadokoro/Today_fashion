# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :set_prefectures, only: %i[new create edit update]
    before_action :set_constitutions, only: %i[new create edit update]
    skip_before_action :verify_authenticity_token, only: [:create]

    def new
      build_resource({})
      session[:user_params] ||= {}
      resource.attributes = session[:user_params]
      @step = params[:step] || "step1"
      render "users/registrations/#{@step}"
    end

    def create
      build_resource(sign_up_params)
      session[:user_params].deep_merge!(sign_up_params.to_h) if sign_up_params
      @step = params[:step] || "step1"
      
      if validate_step(resource, @step)
        case @step
        when "step1"
          redirect_to new_user_registration_step_path(step: "step2")
        when "step2"
          redirect_to new_user_registration_step_path(step: "step3")
        when "step3"
          if resource.save
            yield resource if block_given?
            if resource.active_for_authentication?
              set_flash_message! :notice, :signed_up
              sign_up(resource_name, resource)
              respond_with resource, location: after_sign_up_path_for(resource)
            else
              set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
              expire_data_after_sign_in!
              respond_with resource, location: after_inactive_sign_up_path_for(resource)
            end
          else
            logger.error("User creation failed: #{resource.errors.full_messages.join(', ')}")
            clean_up_passwords resource
            set_minimum_password_length
            flash[:error] = 'ユーザー登録に失敗しました。'
            render "users/registrations/step3"
          end
        end
      else
        render "users/registrations/#{@step}"
      end
    end

    protected

    def validate_step(resource, step)
      case step
      when "step1"
        resource.valid?(:step1)
      when "step2"
        resource.valid?(:step2)
      when "step3"
        resource.valid?
      end
    end

    def update_resource(resource, params)
      resource.update_without_password(params)
    end

    private

    def sign_up_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :prefecture_id,
                                   :second_prefecture_id, :constitution_id, :image)
    end

    def set_prefectures
      @prefectures = Prefecture.all
    end

    def set_constitutions
      @constitutions = Constitution.all
    end
  end
end
