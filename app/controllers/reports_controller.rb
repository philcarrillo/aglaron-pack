class ReportsController < ApplicationController
  def contact_reports
    @rows = InfoRequest.all
    @rowcount = InfoRequest.all.size
  end
end
