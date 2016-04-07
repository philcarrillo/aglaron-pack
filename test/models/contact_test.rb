require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  test "InfoRequest matches Contact with email" do
    contact=contacts(:test1)
    assert_not_nil contact

    info_request = InfoRequest.new({email_address: "larry@isgreat.com"})
    assert_equal contact, Contact.match_contact_from_info_request(info_request)

  end

  test "1. InfoRequest Does Not Contain Matching Fields" do
    # Intialize data
    info_request = InfoRequest.new()
    num_recs = Contact.all.size

    # Run Test
    match_contact = Contact.match_contact_from_info_request(info_request)

    assert_nil match_contact

    assert_equal num_recs, num_recs, "Num rows in contacts should remain the same"
  end

  test "2. InfoRequest Matches phone, contains no other data" do
    # Intialize data
    contact=contacts(:test2)
    assert_not_nil contact


    info_request = InfoRequest.new(phone: contact.phone)
    num_recs = Contact.all.size

    # Run Test
    match_contact = Contact.match_contact_from_info_request(info_request)

    assert_not_nil match_contact

    assert_instance_of( Contact, match_contact, "Results not an active contact model" )

    assert_equal num_recs, num_recs, "Num rows in contacts should remain the same"

    assert_equal contact.email_address, match_contact.email_address
    assert_equal contact.phone, match_contact.phone
    assert_equal contact.company, match_contact.company
    assert_equal contact.contact_method, match_contact.contact_method
    assert_equal contact.name_first, match_contact.name_first
    assert_equal contact.name_last, match_contact.name_last
    assert_equal contact.title, match_contact.title

  end

  test "3. InfoRequest Matches phone, contains only title" do
    # Intialize data
    contact=contacts(:test2)
    assert_not_nil contact


    info_request = InfoRequest.new(phone: contact.phone, title: "chg #{contact.title}")
    num_recs = Contact.all.size

    # Run Test
    match_contact = Contact.match_contact_from_info_request(info_request)

    assert_not_nil match_contact

    assert_instance_of( Contact, match_contact, "Results not an active contact model" )

    assert_equal num_recs, num_recs, "Num rows in contacts should remain the same"

    assert_equal match_contact.email_address, contact.email_address
    assert_equal match_contact.phone, contact.phone
    assert_equal match_contact.company, contact.company
    assert_equal match_contact.contact_method, contact.contact_method
    assert_equal match_contact.name_first, contact.name_first
    assert_equal match_contact.name_last, contact.name_last
    assert_equal match_contact.title, info_request.title

  end

  test "4. InfoRequest Matches phone, contains only name_last" do
    # Intialize data
    contact=contacts(:test2)
    assert_not_nil contact


    info_request = InfoRequest.new(phone: contact.phone, name_last: "chg #{contact.name_last}")
    num_recs = Contact.all.size

    # Run Test
    match_contact = Contact.match_contact_from_info_request(info_request)

    assert_not_nil match_contact

    assert_instance_of( Contact, match_contact, "Results not an active contact model" )

    assert_equal num_recs, num_recs, "Num rows in contacts should remain the same"

    assert_equal match_contact.email_address, contact.email_address
    assert_equal match_contact.phone, contact.phone
    assert_equal match_contact.company, contact.company
    assert_equal match_contact.contact_method, contact.contact_method
    assert_equal match_contact.name_first, contact.name_first
    assert_equal match_contact.name_last, info_request.name_last
    assert_equal match_contact.title, contact.title

  end

end
