class Contact < ActiveRecord::Base
  #has_many :info_requests
  def self.match_contact_from_info_request(info_request)
    ret_contact = nil

    # Try to match existing record in contact
    if ! info_request.email_address.blank?
      ret_contact = Contact.find_by(email_address: info_request.email_address)
    end
    if ret_contact.blank? && ! info_request.phone.blank?
      ret_contact = Contact.find_by(phone: info_request.phone)
    end

    # If no contact found, create a new one if we have at least an email or phone
    if ret_contact.blank? && (! info_request.email_address.blank? || ! info_request.phone.blank?)
      ret_contact = Contact.new()
    end

    # Update our Fields
    if ! info_request.email_address.blank? then ret_contact.email_address = info_request.email_address end
    if ! info_request.name_last.blank? then ret_contact.name_last = info_request.name_last end
    if ! info_request.title.blank? then ret_contact.title = info_request.title end

    return ret_contact
  end

#  private

#  def should_be_updated (i_attribute, c_attribute)#
#    ret = false
#    if ! i_attribute.blank? && ( )
#
#    end

#  end
end
