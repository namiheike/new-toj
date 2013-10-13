class OauthServicesController < Devise::OmniauthCallbacksController
  def passthru(*args)
    # TODO, correct 404 location
    render 'errors/error_404', status: 404, layout: 'error'
  end

  def renren
    oauthorize 'renren'
  end

  def qq_connect
    oauthorize 'qq_connect'
  end

  private

  def oauthorize(provider)
    session[:oauth] = env['omniauth.auth']
    # if @user = OauthService.find_user(provider, env['omniauth.auth']['uid'])
    #   # FIXME, 'douban' in this notice should be chinese one via i18n
    #   flash[:notice] = I18n.t 'devise.sessions.signed_in'
    #   sign_in_and_redirect @user, :event => :authentication
    # else
    #   flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: (I18n.t "devise.oauth_services.providers.#{provider}")
    #   redirect_to oauth_bind_new_path
    # end
  end

end
