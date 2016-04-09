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
    num_init_recs = Contact.all.size

    # Run Test
    match_contact = Contact.match_contact_from_info_request(info_request)

    assert_nil match_contact

    assert_equal num_init_recs, Contact.all.size, "Num rows in contacts should remain the same"
  end

  test "2. InfoRequest Matches phone, contains no other data" do
    # Intialize data
    contact=contacts(:test2)
    assert_not_nil contact


    info_request = InfoRequest.new(phone: contact.phone)
    num_init_recs = Contact.all.size

    # Run Test
    match_contact = Contact.match_contact_from_info_request(info_request)

    assert_not_nil match_contact

    assert_instance_of( Contact, match_contact, "Results not an active contact model" )

    assert_equal num_init_recs, Contact.all.size, "Num rows in contacts should remain the same"

    assert_not_nil match_contact.id, "match id should not be null"
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
    num_init_recs = Contact.all.size

    # Run Test
    match_contact = Contact.match_contact_from_info_request(info_request)

    assert_not_nil match_contact

    assert_instance_of( Contact, match_contact, "Results not an active contact model" )

    assert_equal num_init_recs, Contact.all.size, "Num rows in contacts should remain the same"

    assert_not_nil match_contact.id, "match id should not be null"
    assert_equal contact.email_address, match_contact.email_address
    assert_equal contact.phone, match_contact.phone
    assert_equal contact.company, match_contact.company
    assert_equal contact.contact_method, match_contact.contact_method
    assert_equal contact.name_first, match_contact.name_first
    assert_equal contact.name_last, match_contact.name_last
    assert_equal info_request.title, match_contact.title

  end

  test "4. InfoRequest Matches phone, contains only name_last" do
    # Intialize data
    contact=contacts(:test2)
    assert_not_nil contact


    info_request = InfoRequest.new(phone: contact.phone, name_last: "chg #{contact.name_last}")
    num_init_recs = Contact.all.size

    # Run Test
    match_contact = Contact.match_contact_from_info_request(info_request)

    assert_not_nil match_contact

    assert_instance_of( Contact, match_contact, "Results not an active contact model" )

    assert_equal num_init_recs, Contact.all.size, "Num rows in contacts should remain the same"

    assert_not_nil match_contact.id, "match id should not be null"
    assert_equal contact.email_address, match_contact.email_address
    assert_equal contact.phone, match_contact.phone
    assert_equal contact.company, match_contact.company
    assert_equal contact.contact_method, match_contact.contact_method
    assert_equal contact.name_first, match_contact.name_first
    assert_equal info_request.name_last, match_contact.name_last
    assert_equal contact.title, match_contact.title


  end

  test "5. InfoRequest Matches phone, contains only name_first" do
    # Intialize data
    contact=contacts(:test2)
    assert_not_nil contact


    info_request = InfoRequest.new(phone: contact.phone, name_first: "chg #{contact.name_first}")
    num_init_recs = Contact.all.size

    # Run Test
    match_contact = Contact.match_contact_from_info_request(info_request)

    assert_not_nil match_contact

    assert_instance_of( Contact, match_contact, "Results not an active contact model" )

    assert_equal num_init_recs, Contact.all.size, "Num rows in contacts should remain the same"

    assert_not_nil match_contact.id, "match id should not be null"
    assert_equal contact.email_address, match_contact.email_address
    assert_equal contact.phone, match_contact.phone
    assert_equal contact.company, match_contact.company
    assert_equal contact.contact_method, match_contact.contact_method
    assert_equal info_request.name_first, match_contact.name_first
    assert_equal contact.name_last, match_contact.name_last
    assert_equal contact.title, match_contact.title

  end

  test "6. InfoRequest Matches phone, contains only contact_method" do
    # Intialize data
    contact=contacts(:test2)
    assert_not_nil contact


    info_request = InfoRequest.new(phone: contact.phone, contact_method: "chg #{contact.contact_method}")
    num_init_recs = Contact.all.size

    # Run Test
    match_contact = Contact.match_contact_from_info_request(info_request)

    assert_not_nil match_contact

    assert_instance_of( Contact, match_contact, "Results not an active contact model" )

    assert_equal num_init_recs, Contact.all.size, "Num rows in contacts should remain the same"

    assert_not_nil match_contact.id, "match id should not be null"
    assert_equal contact.email_address, match_contact.email_address
    assert_equal contact.phone, match_contact.phone
    assert_equal contact.company, match_contact.company
    assert_equal info_request.contact_method, match_contact.contact_method
    assert_equal contact.name_first, match_contact.name_first
    assert_equal contact.name_last, match_contact.name_last
    assert_equal contact.title, match_contact.title
  end

#---------------------------------------------------------------------------
  test "7. InfoRequest Matches phone, contains only company" do
    # Intialize data
    contact=contacts(:test2)
    assert_not_nil contact


    info_request = InfoRequest.new(phone: contact.phone, company: "chg #{contact.company}")
    num_init_recs = Contact.all.size

    # Run Test
    match_contact = Contact.match_contact_from_info_request(info_request)

    assert_not_nil match_contact

    assert_instance_of( Contact, match_contact, "Results not an active contact model" )

    assert_equal num_init_recs, Contact.all.size, "Num rows in contacts should remain the same"

    assert_not_nil match_contact.id, "match id should not be null"
    assert_equal contact.email_address, match_contact.email_address
    assert_equal contact.phone, match_contact.phone
    assert_equal info_request.company, match_contact.company
    assert_equal contact.contact_method, match_contact.contact_method
    assert_equal contact.name_first, match_contact.name_first
    assert_equal contact.name_last, match_contact.name_last
    assert_equal contact.title, match_contact.title


  end

  test "8. InfoRequest Does NOT Match phone, contains only phone" do
    # Intialize data
    contact=contacts(:test2)
    assert_not_nil contact


    info_request = InfoRequest.new(phone: "chg #{contact.phone}", company: "chg #{contact.company}")
    num_init_recs = Contact.all.size

    # Run Test
    match_contact = Contact.match_contact_from_info_request(info_request)

    assert_not_nil match_contact

    assert_instance_of( Contact, match_contact, "Results not an active contact model" )

    assert_equal num_init_recs + 1, Contact.all.size, "Num rows in contacts should increase by 1"

    assert_not_nil match_contact.id, "match id should not be null"
    assert_equal info_request.email_address, match_contact.email_address
    assert_equal info_request.phone, match_contact.phone
    assert_equal info_request.company, match_contact.company
    assert_equal info_request.contact_method, match_contact.contact_method
    assert_equal info_request.name_first, match_contact.name_first
    assert_equal info_request.name_last, match_contact.name_last
    assert_equal info_request.title, match_contact.title

  end

  #---------------------------------------------------------------------------
  test "9. InfoRequest Matches email, contains other data" do
    # Intialize data
    contact=contacts(:test2)
    assert_not_nil contact

    info_request = InfoRequest.new(email_address: contact.email_address)
    num_init_recs = Contact.all.size

    # Run Test
    match_contact = Contact.match_contact_from_info_request(info_request)

    assert_not_nil match_contact

    assert_instance_of( Contact, match_contact, "Results not an active contact model" )

    assert_equal num_init_recs, Contact.all.size, "Num rows in contacts should remain the same"

    assert_not_nil match_contact.id, "match id should not be null"
    assert_equal contact.email_address, match_contact.email_address
    assert_equal contact.phone, match_contact.phone
    assert_equal contact.company, match_contact.company
    assert_equal contact.contact_method, match_contact.contact_method
    assert_equal contact.name_first, match_contact.name_first
    assert_equal contact.name_last, match_contact.name_last
    assert_equal contact.title, match_contact.title
  end


end
