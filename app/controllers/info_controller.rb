class InfoController < ApplicationController
  def about
  end

  def contact
    @silly = '<u>The Evironment</u><br>'
    ENV.each do |theItem|
  	   @silly += "<br>Object: #{theItem} Of Type #{theItem.class}"
     end
     @silly = @silly.html_safe
  end

  def history
  end

  def services
  end

  def procurement
  end

  def packaging
  end


end
