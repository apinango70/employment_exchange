require "application_system_test_case"

class JobPostingsTest < ApplicationSystemTestCase
  setup do
    @job_posting = job_postings(:one)
  end

  test "visiting the index" do
    visit job_postings_url
    assert_selector "h1", text: "Job postings"
  end

  test "should create job posting" do
    visit job_postings_url
    click_on "New job posting"

    fill_in "Department", with: @job_posting.department
    fill_in "Description", with: @job_posting.description
    fill_in "Title", with: @job_posting.title
    fill_in "User", with: @job_posting.user_id
    click_on "Create Job posting"

    assert_text "Job posting was successfully created"
    click_on "Back"
  end

  test "should update Job posting" do
    visit job_posting_url(@job_posting)
    click_on "Edit this job posting", match: :first

    fill_in "Department", with: @job_posting.department
    fill_in "Description", with: @job_posting.description
    fill_in "Title", with: @job_posting.title
    fill_in "User", with: @job_posting.user_id
    click_on "Update Job posting"

    assert_text "Job posting was successfully updated"
    click_on "Back"
  end

  test "should destroy Job posting" do
    visit job_posting_url(@job_posting)
    click_on "Destroy this job posting", match: :first

    assert_text "Job posting was successfully destroyed"
  end
end
