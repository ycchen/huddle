class StatusReportsController < ApplicationController
 before_filter :authenticate_user!, :only => [:new, :edit, :update, :destroy]
  # GET /status_reports
  # GET /status_reports.json
  def index
    if current_user
      @status_reports = current_user.status_reports.order("created_at DESC")
    else
      @status_reports = StatusReport.all
    end
    
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @status_reports }
    end
  end

  # GET /status_reports/1
  # GET /status_reports/1.json
  def show
    @status_report = StatusReport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @status_report }
    end
  end

  # GET /status_reports/new
  # GET /status_reports/new.json
  def new
    @status_report = StatusReport.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @status_report }
    end
  end

  # GET /status_reports/1/edit
  def edit
    @status_report = StatusReport.find(params[:id])
    @projects = current_user.projects.order('name ASC')
  end

  # POST /status_reports
  # POST /status_reports.json
  def create
     
    @status_report = StatusReport.new(params[:status_report])
    @status_report.user_id = current_user.id
    @status_report.status_date = Time.zone.now.to_datetime

    respond_to do |format|
      if @status_report.save
        format.html { redirect_to @status_report, notice: 'Status report was successfully created.' }
        format.json { render json: @status_report, status: :created, location: @status_report }
      else
        format.html { render action: "new" }
        format.json { render json: @status_report.errors, status: :unprocessable_entity }
      end
    end

  end

  # PUT /status_reports/1
  # PUT /status_reports/1.json
  def update
    @status_report = StatusReport.find(params[:id])

    respond_to do |format|
      if @status_report.update_attributes(params[:status_report])
        format.html { redirect_to @status_report, notice: 'Status report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @status_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /status_reports/1
  # DELETE /status_reports/1.json
  def destroy
    @status_report = StatusReport.find(params[:id])
    @status_report.destroy

    respond_to do |format|
      format.html { redirect_to status_reports_url }
      format.json { head :no_content }
    end
  end
end
