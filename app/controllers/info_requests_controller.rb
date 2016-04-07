class InfoRequestsController < ApplicationController
  def new
  end

  def create
#    @what = params.inspect
#    chkparas
#    @info_requests = InfoRequest.new(chkparas)
      t=Time.now

      @info_requests = InfoRequest.first
      @info_requests.email_address = t.strftime("%H:%M:%S:") + "phil@carrillo.ca"
    if @info_requests.valid?
      if @info_requests.save # :validate => false
        @saved_it = "Yeah, saved it"
      else
        @saved_it = "Nope, did NOT do it"
      end
################################################################################
#      @contact_paras = ActionController::Parameters.new({
#         contact: { company: @info_requests.company,
#                    contact_method: @info_requests.contact_method,
#                    email: @info_requests.email,
#                    age:  22,
#                    role: 'admin'
#        }
#                    })
#
#


    #  @phil = Contact.get_contact_from_paras(chkparas)
      @whatjusthappened = "OK"
    else
      @whatjusthappened = "**Error: #{@info_requests.errors.messages}"
    end

    #------------------------------------------------------------------------------
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
  end

  private
    def chkparas
      params.require(:info_requests).permit(:comment, :company, :contact_id, :contact_method, :help_required, :email_address, :name_first, :name_last, :phone, :title )
    #  @info_request_paras = params.require(:info_requests).permit(:comment, :company, :contact_id, :contact_method, :help_required, :email, :name_first, :name_last, :phone, :title )
    #  @contact_paras = params.require(:info_requests).permit(:comment, :company, :contact_id, :contact_method, :help_required, :email, :name_first, :name_last, :phone, :title )
    end
end
