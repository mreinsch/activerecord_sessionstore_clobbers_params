class HomeController < ApplicationController
  before_filter :set_locale
  before_filter :redirect_to_locale_path

  private
  def set_locale
    puts params.inspect
    I18n.locale = params[:locale]
  end

  def redirect_to_locale_path
    unless params[:locale]
      redirect_to :locale => I18n.locale
    end
  end
end
