class PostulationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job_posting

  def new
    @postulation = Postulation.new
  end



  def create
    @job_posting = JobPosting.find(params[:job_posting_id])

    if current_user.postulations.exists?(job_posting_id: @job_posting.id)
      flash[:alert] = "You have successfully applied!"
      redirect_to @job_posting
    else
      @postulation = Postulation.new(user: current_user, job_posting: @job_posting)
      if @postulation.save
        flash[:notice] = "Successful application."
        redirect_to @job_posting
      else
        flash[:alert] = "There was an error processing the application."
        render 'new'
      end
    end
  end

  private

  def set_job_posting
    @job_posting = JobPosting.find(params[:job_posting_id])
  end

  def postulation_params
    params.require(:postulation).permit(:message)
  end
end

