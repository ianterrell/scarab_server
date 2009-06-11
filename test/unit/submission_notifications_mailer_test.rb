require 'test_helper'

class SubmissionNotificationsMailerTest < ActionMailer::TestCase
  test "first_reading" do
    @expected.subject = 'SubmissionNotificationsMailer#first_reading'
    @expected.body    = read_fixture('first_reading')
    @expected.date    = Time.now

    assert_equal @expected.encoded, SubmissionNotificationsMailer.create_first_reading(@expected.date).encoded
  end

  test "second_reading" do
    @expected.subject = 'SubmissionNotificationsMailer#second_reading'
    @expected.body    = read_fixture('second_reading')
    @expected.date    = Time.now

    assert_equal @expected.encoded, SubmissionNotificationsMailer.create_second_reading(@expected.date).encoded
  end

  test "rejected" do
    @expected.subject = 'SubmissionNotificationsMailer#rejected'
    @expected.body    = read_fixture('rejected')
    @expected.date    = Time.now

    assert_equal @expected.encoded, SubmissionNotificationsMailer.create_rejected(@expected.date).encoded
  end

  test "rejected_with_promise" do
    @expected.subject = 'SubmissionNotificationsMailer#rejected_with_promise'
    @expected.body    = read_fixture('rejected_with_promise')
    @expected.date    = Time.now

    assert_equal @expected.encoded, SubmissionNotificationsMailer.create_rejected_with_promise(@expected.date).encoded
  end

  test "accepted" do
    @expected.subject = 'SubmissionNotificationsMailer#accepted'
    @expected.body    = read_fixture('accepted')
    @expected.date    = Time.now

    assert_equal @expected.encoded, SubmissionNotificationsMailer.create_accepted(@expected.date).encoded
  end

end
