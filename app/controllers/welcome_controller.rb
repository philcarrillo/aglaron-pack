class WelcomeController < ApplicationController
  def index
    @co = company_name
    @cos = company_name_short
  end
  def testor
    "Silly"
  end
end
