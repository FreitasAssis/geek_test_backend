class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  require 'net/http'
  require 'json'

  # GET /jobs
  # GET /jobs.json
  def index
    if Job.count == 0
      source = 'https://geekhunter-recruiting.s3.amazonaws.com/code_challenge.json'
      resp = Net::HTTP.get_response(URI.parse(source))
      data = resp.body
      result = JSON.parse(data)
      result["jobs"].each do |j|
        job = Job.new({ city: j["city"], experience: j["experience"], technologies: j["technologies"] })
        # if Job.find_by_code(j["code"]).nil?
        #   job.save
        # end
        job.save
      end
    end
    @jobs = Job.all
  end

  def find_candidates_by_city
    city = Job.find(params[:id]).city
    unless city.nil? || city == "Remote"
      @candidates = Candidate.where(city: city).sort { |a,b| b.experience.to_i <=> a.experience.to_i }
    else
      @candidates = Candidate.all.sort { |a,b| b.experience.to_i <=> a.experience.to_i }
    end
  end

  def find_candidates_by_experience
    experience = Job.find(params[:id]).experience
    i = experience.include?("-") ? experience.index("-") : experience.index("+")
    min = experience[0..i - 1]
    candidates = []
    unless experience.nil?
      # @candidates = Candidate.where(experience: experience)
      Candidate.all.each do |candidate|
        c_experience = candidate.experience
        c_i = c_experience.include?("-") ? c_experience.index("-") : c_experience.index("+")
        c_min = c_experience[0..c_i - 1]
        if c_min.to_i >= min.to_i
          candidates.push(candidate)
        end
      end
    end
    @candidates = candidates.sort { |a,b| b.experience.to_i <=> a.experience.to_i }
  end

  def find_candidates_by_technologies
    candidates = []
    technologies = Job.find(params[:id]).technologies
    technologies.each do |technology|
      unless technology.nil?
        Candidate.all.each do |candidate|
          candidate.technologies.each do |tech|
            if tech.include?(technology)
              candidates.push(candidate)
            end
          end
        end
      end
    end
    @candidates = candidates.sort { |a,b| b.experience.to_i <=> a.experience.to_i }
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_params
      params.require(:job).permit(:city, :experience)
    end
end
