class InfoRequestsController < ApplicationController
  def new
  end

  def create
    @what = params[:info_requests].inspect
    @info_requests = InfoRequest.new(chkparas)
    if @info_requests.valid?
      # @info_requests.save
      @whatjusthappened = "OK"
    else
      @whatjusthappened = "**Error: #{@info_requests.errors.messages}"
    end
  end

  private
    def chkparas
      params.require(:info_requests).permit(:comment, :company, :contact_id, :contact_method, :help_required, :email, :name_first, :name_last, :phone, :title )
    end
end
