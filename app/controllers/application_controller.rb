class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    if params[:locale].present?
      cookies[:locale] = params[:locale]
    end

    if cookies[:locale].present?
      if I18n.locale != cookies[:locale]
        I18n.locale = cookies[:locale]
      end
    end
  end
end
