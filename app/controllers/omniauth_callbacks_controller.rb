# frozen_string_literal: true

# ApplicationControllerをDevise::OmniauthCallbacksControllerに変更
class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def line
    basic_action
  end

  private

  def basic_action
    @omniauth = request.env['omniauth.auth']

    if @omniauth.present?
      @profile = User.find_or_initialize_by(provider: @omniauth['provider'], uid: @omniauth['uid'])

      # ユーザーのemailが空の場合、LINEから取得できる場合はそれを、できない場合は仮のemailを使用して新しいユーザーを作成
      if @profile.email.blank?
        email = @omniauth['info']['email'].presence || fake_email(@omniauth['uid'], @omniauth['provider'])
        @profile = current_user || User.create!(
          provider: @omniauth['provider'],
          uid: @omniauth['uid'],
          email:,
          name: @omniauth['info']['name'],
          password: Devise.friendly_token[0, 20]
        )
      end

      # ユーザーのプロフィール情報を更新
      @profile.set_values(@omniauth)

      # ログイン状態にする
      sign_in(:user, @profile)
    end

    flash[:notice] = 'ログインしました'
    redirect_to root_path
  end

  def fake_email(uid, provider)
    "#{uid}-#{provider}@example.com"
  end
end
