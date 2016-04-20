class Contact < ActiveRecord::Base
  has_many :info_requests
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
    if ! ret_contact.blank?
      ret_contact.email_address  = info_request.email_address  if ! info_request.email_address.blank?
      ret_contact.phone          = info_request.phone          if ! info_request.phone.blank?
      ret_contact.company        = info_request.company        if ! info_request.company.blank?
      ret_contact.contact_method = info_request.contact_method if ! info_request.contact_method.blank?
      ret_contact.name_first     = info_request.name_first     if ! info_request.name_first.blank?
      ret_contact.name_last      = info_request.name_last      if ! info_request.name_last.blank?
      ret_contact.title          = info_request.title          if ! info_request.title.blank?

      ret_contact.save
    end

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
