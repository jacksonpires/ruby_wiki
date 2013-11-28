class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!, :set_wiki_detail

  protected

  def set_wiki_detail
    @wiki_detail ||= WikiDetail.first.decorate
  end
end
