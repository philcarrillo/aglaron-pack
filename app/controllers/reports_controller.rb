class ReportsController < ApplicationController
  def contact_reports
    @rows = InfoRequest.all
    @rowcount = InfoRequest.all.size

    @report = InfoRequest.joins("LEFT OUTER JOIN contacts ON contacts.id = info_requests.contact_id")\
    .select("contacts.name_last as c_last, info_requests.name_last as i_last
    , info_requests.id, info_requests.contact_id
    , contacts.name_first as c_first, info_requests.name_first as i_first
    , contacts.email_address as c_email, info_requests.email_address as i_email
    , contacts.phone as c_phone, info_requests.phone as i_phone
    , contacts.title as c_title, info_requests.title as i_title
    , contacts.company as c_company, info_requests.company as i_company
    , contacts.contact_method as c_contact_method, info_requests.contact_method as i_contact_method
    , info_requests.comment as i_comment, info_requests.help_required as i_help_required
    , info_requests.updated_at as i_updated_at, contacts.updated_at as c_updated_at
    ")\
    .order('info_requests.contact_id DESC, contacts.updated_at DESC, info_requests.updated_at DESC')
#    @report = InfoRequest.includes(:contact).where("id > 2")
#    .joins(:contacts)
#    .select("contacts.name_last, info_requests.id")
#    .order('info_requests.created_at DESC')


    @sql = @report.to_sql
    #puts @sql
  end
  def self.form_contact (the_id:, the_time:, first:, last:, title: nil, company: nil, phone: nil, email: nil, contact_method: nil)
    date = Time.parse the_time
    missing = "?"
    indent = "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
    result = "#{the_id}) #{date.strftime("%Y-%m-%d %H:%M:%S")}"

    ## -- Line 1 First name, last name, title, company
    result += indent
    if first.blank? then result += missing else  result += "#{first}" end
    result += "&nbsp;"
    if last.blank? then result += missing else  result += "#{last}" end
    result += "&nbsp;&nbsp;&nbsp;"
    if title.blank? then result += missing else  result += "#{title}" end
    result += "&nbsp;&nbsp;&nbsp;"
    if company.blank? then result += missing else  result += "#{company}" end

    ## -- Line 2 phone email
    result += indent
    if phone.blank? then result += missing else  result += "#{phone}" end
    result += "&nbsp;&nbsp;&nbsp;"
    if email.blank? then result += missing else  result += "#{email}" end

    ## -- Line 3 contact_method
    result += indent
    result += "<b>Contact via</b>: #{contact_method}"
    return result

  end
end
