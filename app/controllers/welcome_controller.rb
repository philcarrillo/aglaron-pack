class WelcomeController < ApplicationController
  def index
    @co = company_name
    @cos = company_name_short
    @curl = company_url
  end
  def testor
    "Silly"
  end
end
