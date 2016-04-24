class InfoRequestsController < ApplicationController
  def new
  end

  def create
    @whatjusthappened = "OK"

    @info_request = InfoRequest.new(chkparas)
    @contact = Contact.match_contact_from_info_request(@info_request)
    # Did we have enough data to create a contact?
    if @contact.blank?
      @whatjusthappened = "Not Enough Data"
    end

    if @whatjusthappened == "OK"
      @info_request.contact_id = @contact.id
    end

    if @whatjusthappened == "OK" && @info_request.valid?
      if ! @info_request.save # :validate => false
        @whatjusthappened = "**Error: #{@info_request.errors.messages}"
      end
    end

    #------------------------------------------------------------------------------
=begin
    @pingstuff = "<br>Pingstuff"
    @ping = Ping.new

    @ping.msg_type="Gen"
    @ping.msg = "Hello, we are on line: #{__LINE__}"
    if @ping.valid?
      @pingstuff += "<br>Ping is valid at line #{__LINE__}"
      @ping.save
    else
      @pingstuff += "<br>Ping is NOT valid at line #{__LINE__}"
    end

    @ping = Ping.find(7)
  #  @ping.msg_type = nil

    themsg = @ping.msg
    if ! themsg.include? "Mod"
      themsg += " Modified on Line: #{__LINE__}"
    end
    @ping.mod_count += 1
    @ping.msg = themsg
    if @ping.valid?
      @pingstuff += "<br>Ping is valid at line #{__LINE__}"
      @ping.save
    else
      @pingstuff += "<br>Ping is NOT valid at line #{__LINE__}"
    end




    @thecount = "The Present table count: #{InfoRequest.all.size}"
    @thepingcount = "The Present table count: #{Ping.all.size}"
    @last5pings = Ping.order(updated_at: :desc).first(5)
=end
  end

  private
    def chkparas
      params.require(:info_requests).permit(:comment, :company, :contact_id, :contact_method, :help_required, :email_address, :name_first, :name_last, :phone, :title )
    #  @info_request_paras = params.require(:info_requests).permit(:comment, :company, :contact_id, :contact_method, :help_required, :email, :name_first, :name_last, :phone, :title )
    #  @contact_paras = params.require(:info_requests).permit(:comment, :company, :contact_id, :contact_method, :help_required, :email, :name_first, :name_last, :phone, :title )
    end
end
