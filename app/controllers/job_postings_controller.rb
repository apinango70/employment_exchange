class JobPostingsController < ApplicationController
  before_action :set_job_posting, only: %i[ show edit update destroy ]
  #before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /job_postings or /job_postings.json
  def index
    @job_postings = JobPosting.all
  end

  # GET /job_postings/1 or /job_postings/1.json
  def show
    if user_signed_in?
      # El usuario está autenticado, puede ver el trabajo.
    else
      # El usuario no está autenticado, redirigir a la página de inicio de sesión.
      redirect_to new_user_session_path, alert: "You need to sign in to view this job posting."
    end
  end

  # GET /job_postings/new
  def new
    if current_user.admin?
      @job_posting = JobPosting.new
    else
      redirect_to job_postings_path, alert: "Only administrators can create job postings."
    end
  end

  # GET /job_postings/1/edit
  def edit
    authorize_edit
  end

  # POST /job_postings or /job_postings.json
  def create
    @job_posting = current_user.job_postings.build(job_posting_params)

    respond_to do |format|
      if @job_posting.save
        format.html { redirect_to job_posting_url(@job_posting), notice: "Job posting was successfully created." }
        format.json { render :show, status: :created, location: @job_posting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job_posting.errors, status: :unprocessable_entity }
      end
    end
  end




  
  # PATCH/PUT /job_postings/1 or /job_postings/1.json
  def update
    authorize_edit
    respond_to do |format|
      if @job_posting.update(job_posting_params)
        format.html { redirect_to job_posting_url(@job_posting), notice: "Job posting was successfully updated." }
        format.json { render :show, status: :ok, location: @job_posting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job_posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_postings/1 or /job_postings/1.json
  def destroy
    authorize_edit
    @job_posting.destroy

    respond_to do |format|
      format.html { redirect_to job_postings_url, notice: "Job posting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job_posting = JobPosting.find(params[:id])
    end
    
    def set_job_posting
      @job_posting = JobPosting.find(params[:id])
    end

    def authorize_edit
      unless current_user.admin?
        redirect_to jobs_path, alert: 'You do not have permission to perform this action.'
      end
    end
    
    # Only allow a list of trusted parameters through.
    def job_posting_params
      params.require(:job_posting).permit(:title, :department, :description)
    end
end
