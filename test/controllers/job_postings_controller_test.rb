require "test_helper"

class JobPostingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_posting = job_postings(:one)
  end

  test "should get index" do
    get job_postings_url
    assert_response :success
  end

  test "should get new" do
    get new_job_posting_url
    assert_response :success
  end

  test "should create job_posting" do
    assert_difference("JobPosting.count") do
      post job_postings_url, params: { job_posting: { department: @job_posting.department, description: @job_posting.description, title: @job_posting.title, user_id: @job_posting.user_id } }
    end

    assert_redirected_to job_posting_url(JobPosting.last)
  end

  test "should show job_posting" do
    get job_posting_url(@job_posting)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_posting_url(@job_posting)
    assert_response :success
  end

  test "should update job_posting" do
    patch job_posting_url(@job_posting), params: { job_posting: { department: @job_posting.department, description: @job_posting.description, title: @job_posting.title, user_id: @job_posting.user_id } }
    assert_redirected_to job_posting_url(@job_posting)
  end

  test "should destroy job_posting" do
    assert_difference("JobPosting.count", -1) do
      delete job_posting_url(@job_posting)
    end

    assert_redirected_to job_postings_url
  end
end
