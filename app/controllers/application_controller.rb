class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def company_name
    @co = "Aglaron Procurement & Packaging"
  end
  def company_name_short
    @cos = "Aglaron"
  end
end
