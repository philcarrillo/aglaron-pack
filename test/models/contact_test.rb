require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  test "InfoRequest matches Contact with email" do
    contact=contacts(:test1)
    assert_not_nil contact

    info_request = InfoRequest.new({email_address: "larry@isgreat.com"})
    assert_equal contact, Contact.match_contact_from_info_request(info_request)

  end

  test "01 InfoRequest Does Not Contain Matching Fields" do
    # Intialize data
    # The contact that we are expecting not to match
    contact = contacts(:test2)
    assert_not_nil contact    # Is this a meaningful assertion?

    # The info_request - this represents the test case data
    info_request = InfoRequest.new()
                              # Should I test is this is not nil?

    # Now modify contact to reflect what we expect our Contact instance to
    # be returned from Contact::match_contact_from_info_request
    # --- no changes in this case


    # Run Test
    # OK, Now run the test
    chk_test contact,info_request, :ret_nil
  end

  test "02 InfoRequest Matches phone, contains no other data" do
    # Intialize data
    # The contact that we are expecting to match
    contact = contacts(:test2)
    assert_not_nil contact    # Is this a meaningful assertion?

    # The info_request - this represents the test case data
    info_request = InfoRequest.new(phone: contact.phone)
                              # Should I test is this is not nil?

    # Now modify contact to reflect what we expect our Contact instance to
    # be returned from Contact::match_contact_from_info_request
    # --- no changes in this case

    # OK, Now run the test
    chk_test contact,info_request, :match
  end

  test "03 InfoRequest Matches phone, contains only title" do
    # Intialize data
    # The contact that we are expecting to match
    contact = contacts(:test2)
    assert_not_nil contact    # Is this a meaningful assertion?

    # The info_request - this represents the test case data
    info_request = InfoRequest.new(phone: contact.phone, title: "chg #{contact.title}")
                              # Should I test is this is not nil?

    # Now modify contact to reflect what we expect our Contact instance to
    # be returned from Contact::match_contact_from_info_request
    # title should be changed and reflect title from info_request
    contact.title = info_request.title

    # OK, Now run the test
    chk_test contact,info_request, :match
  end

  test "04 InfoRequest Matches phone, contains only name_last" do
    # Intialize data
    # The contact that we are expecting to match
    contact = contacts(:test2)
    assert_not_nil contact    # Is this a meaningful assertion?

    # The info_request - this represents the test case data
    info_request = InfoRequest.new(phone: contact.phone, name_last: "chg #{contact.name_last}")
                              # Should I test is this is not nil?

    # Now modify contact to reflect what we expect our Contact instance to
    # be returned from Contact::match_contact_from_info_request
    # name_last should be changed and reflect name_last from info_request
    contact.name_last = info_request.name_last

    # OK, Now run the test
    chk_test contact,info_request, :match
  end

  test "05 InfoRequest Matches phone, contains only name_first" do
    # Intialize data
    # The contact that we are expecting to match
    contact = contacts(:test2)
    assert_not_nil contact    # Is this a meaningful assertion?

    # The info_request - this represents the test case data
    info_request = InfoRequest.new(phone: contact.phone, name_first: "chg #{contact.name_first}")
                              # Should I test is this is not nil?

    # Now modify contact to reflect what we expect our Contact instance to
    # be returned from Contact::match_contact_from_info_request
    # name_first should be changed and reflect name_first from info_request
    contact.name_first = info_request.name_first
    # OK, Now run the test
    chk_test contact,info_request, :match

  end

  test "06 InfoRequest Matches phone, contains only contact_method" do
    # Intialize data
    # The contact that we are expecting to match
    contact = contacts(:test2)
    assert_not_nil contact    # Is this a meaningful assertion?

    # The info_request - this represents the test case data
    info_request = InfoRequest.new(phone: contact.phone, contact_method: "chg #{contact.contact_method}")
                              # Should I test is this is not nil?

    # Now modify contact to reflect what we expect our Contact instance to
    # be returned from Contact::match_contact_from_info_request
    # contact_method should be changed and reflect contact_method from info_request
    contact.contact_method = info_request.contact_method

    # OK, Now run the test
    chk_test contact,info_request, :match

  end

  test "07 InfoRequest Matches phone, contains only company" do
    # Intialize data
    # The contact that we are expecting to match
    contact = contacts(:test2)
    assert_not_nil contact    # Is this a meaningful assertion?

    # The info_request - this represents the test case data
    info_request = InfoRequest.new(phone: contact.phone, company: "chg #{contact.company}")
                              # Should I test is this is not nil?

    # Now modify contact to reflect what we expect our Contact instance to
    # be returned from Contact::match_contact_from_info_request
    # company should be changed and reflect company from info_request
    contact.company = info_request.company

    # OK, Now run the test
    chk_test contact,info_request, :match

  end

  test "08 InfoRequest Does NOT Match phone, contains only phone" do
    # Intialize data

    # The info_request - this represents the test case data
    info_request = InfoRequest.new(phone: "xxx.xxx.xxxx")  # xxx.xxx.xxxx should not match any phone
                              # Should I test is this is not nil?

    # Set contact to reflect what we expect our Contact instance to
    # be returned from Contact::match_contact_from_info_request
    # expect contact should be the same as info_request
    contact = info_request

    # OK, Now run the test
    chk_test contact,info_request, :new

  end

  test "09 InfoRequest Matches email, contains no other data" do
    # Intialize data
    # The contact that we are expecting to match
    contact = contacts(:test2)
    assert_not_nil contact    # Is this a meaningful assertion?

    # The info_request - this represents the test case data
    info_request = InfoRequest.new(email_address: contact.email_address)
                              # Should I test is this is not nil?

    # Now modify contact to reflect what we expect our Contact instance to
    # be returned from Contact::match_contact_from_info_request
    # contact should not change, as there is no new data in info_request


    # OK, Now run the test
    chk_test contact,info_request, :match

  end

  test "10 InfoRequest Matches email_address, contains only title" do
    # Intialize data
    # The contact that we are expecting to match
    contact = contacts(:test2)
    assert_not_nil contact    # Is this a meaningful assertion?

    # The info_request - this represents the test case data
    info_request = InfoRequest.new(email_address: contact.email_address, title: "chg #{contact.title}")
                              # Should I test is this is not nil?

    # Now modify contact to reflect what we expect our Contact instance to
    # be returned from Contact::match_contact_from_info_request
    # title should be changed and reflect title from info_request
    contact.title = info_request.title

    # OK, Now run the test
    chk_test contact,info_request, :match
  end

  test "11 InfoRequest Matches email_address, contains only name_last" do
    # Intialize data
    # The contact that we are expecting to match
    contact = contacts(:test2)
    assert_not_nil contact    # Is this a meaningful assertion?

    # The info_request - this represents the test case data
    info_request = InfoRequest.new(email_address: contact.email_address, name_last: "chg #{contact.name_last}")
                              # Should I test is this is not nil?

    # Now modify contact to reflect what we expect our Contact instance to
    # be returned from Contact::match_contact_from_info_request
    # name_last should be changed and reflect name_last from info_request
    contact.name_last = info_request.name_last

    # OK, Now run the test
    chk_test contact,info_request, :match
  end

  test "12 InfoRequest Matches email_address, contains only name_first" do
    # Intialize data
    # The contact that we are expecting to match
    contact = contacts(:test2)
    assert_not_nil contact    # Is this a meaningful assertion?

    # The info_request - this represents the test case data
    info_request = InfoRequest.new(email_address: contact.email_address, name_first: "chg #{contact.name_first}")
                              # Should I test is this is not nil?

    # Now modify contact to reflect what we expect our Contact instance to
    # be returned from Contact::match_contact_from_info_request
    # name_first should be changed and reflect name_first from info_request
    contact.name_first = info_request.name_first

    # OK, Now run the test
    chk_test contact,info_request, :match

  end

  test "13 InfoRequest Matches email_address, contains only contact_method" do
    # Intialize data
    # The contact that we are expecting to match
    contact = contacts(:test2)
    assert_not_nil contact    # Is this a meaningful assertion?

    # The info_request - this represents the test case data
    info_request = InfoRequest.new(email_address: contact.email_address, contact_method: "chg #{contact.contact_method}")
                              # Should I test is this is not nil?

    # Now modify contact to reflect what we expect our Contact instance to
    # be returned from Contact::match_contact_from_info_request
    # contact_method should be changed and reflect contact_method from info_request
    contact.contact_method = info_request.contact_method

    # OK, Now run the test
    chk_test contact,info_request, :match

  end

  test "14 InfoRequest Matches email_address, contains only company" do
    # Intialize data
    # The contact that we are expecting to match
    contact = contacts(:test2)
    assert_not_nil contact    # Is this a meaningful assertion?

    # The info_request - this represents the test case data
    info_request = InfoRequest.new(email_address: contact.email_address, company: "chg #{contact.company}")
                              # Should I test is this is not nil?

    # Now modify contact to reflect what we expect our Contact instance to
    # be returned from Contact::match_contact_from_info_request
    # company should be changed and reflect company from info_request
    contact.company = info_request.company

    # OK, Now run the test
    chk_test contact,info_request, :match

  end

  test "15 InfoRequest Matches email_address, contains only (non match) phone" do
    # Intialize data
    # The contact that we are expecting to match
    contact = contacts(:test2)
    assert_not_nil contact    # Is this a meaningful assertion?

    # The info_request - this represents the test case data
    info_request = InfoRequest.new(email_address: contact.email_address, phone: "chg #{contact.phone}")
                              # Should I test is this is not nil?

    # Now modify contact to reflect what we expect our Contact instance to
    # be returned from Contact::match_contact_from_info_request
    # company should be changed and reflect company from info_request
    contact.phone = info_request.phone

    # OK, Now run the test
    chk_test contact,info_request, :match

  end

  test "16 InfoRequest Matches phone, contains only (non match) email_address" do
    # Intialize data
    # The contact that we are expecting to match
    contact = contacts(:test2)
    assert_not_nil contact    # Is this a meaningful assertion?

    # The info_request - this represents the test case data
    info_request = InfoRequest.new(email_address: "chg #{contact.email_address}", phone: contact.phone)
                              # Should I test is this is not nil?

    # Now modify contact to reflect what we expect our Contact instance to
    # be returned from Contact::match_contact_from_info_request
    # company should be changed and reflect company from info_request
    contact.email_address = info_request.email_address

    # OK, Now run the test
    chk_test contact,info_request, :match

  end


  test "17 InfoRequest Does NOT Match phone or email" do
    # Intialize data

    # The info_request - this represents the test case data
    info_request = InfoRequest.new(phone: "xxx.xxx.xxxx", email_address: "xxxx@xxx.com")  # x's' should not match any phone
                              # Should I test is this is not nil?

    # Set contact to reflect what we expect our Contact instance to
    # be returned from Contact::match_contact_from_info_request
    # expect contact should be the same as info_request
    contact = info_request

    # OK, Now run the test
    chk_test contact,info_request, :new

  end

#===================================================================================================
  ## This method runs a test of the Contact class method match_contact_from_info_request
  ## An instance of InfoRequest is supplied with the test data
  ## An instance of Contact is supplied with the expected data
  ## The expected_result variable can contain :new, :match (Default)  and any other symbol
  ## means that an error is expected and no Contact Instance would be created
  def chk_test (correct_contact,info_request, expected_result = :match)
    # Get the number of records in contacts before we run our test
    num_existing_recs = Contact.all.size

    resulting_contact = Contact.match_contact_from_info_request(info_request)

    if expected_result == :new
      assert_not_nil resulting_contact, "[#{expected_result}]: Expecting an instance of Contact "
      assert_instance_of( Contact, resulting_contact, "[#{expected_result}]: Results not an Contact class" )
      assert_equal num_existing_recs + 1, Contact.all.size, "[#{expected_result}]: Should create new row in contacts"
    elsif expected_result == :match
      assert_not_nil resulting_contact, "[#{expected_result}]: Expecting an instance of Contact"
      assert_instance_of( Contact, resulting_contact, "[#{expected_result}]: Results not an Contact class" )
      assert_equal num_existing_recs, Contact.all.size, "[#{expected_result}]: Should be no new rows in contacts"
    else
      assert_nil resulting_contact, "[#{expected_result}]: Should not return an instance of Contact"
      assert_equal num_existing_recs, Contact.all.size, "[#{expected_result}]: Should be no new rows in contacts"
    end



    ## -- Test the Results -----------------------------------------------------
    if expected_result == :new || expected_result == :match
      assert_not_nil resulting_contact.id, "match id should not be null"
      assert_equal correct_contact.email_address, resulting_contact.email_address, "unexpected email_address"
      assert_equal correct_contact.phone, resulting_contact.phone, "unexpected phone"
      assert_equal correct_contact.company, resulting_contact.company, "unexpected company"
      assert_equal correct_contact.contact_method, resulting_contact.contact_method, "unexpected contact_method"
      assert_equal correct_contact.name_first, resulting_contact.name_first, "unexpected name_first"
      assert_equal correct_contact.name_last, resulting_contact.name_last, "unexpected name_last"
      assert_equal correct_contact.title, resulting_contact.title, "unexpected title"
    end

  end

end
