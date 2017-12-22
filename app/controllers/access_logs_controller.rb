class AccessLogsController < ApplicationController
  before_action :set_access_log, only: [:show, :edit, :update, :destroy]

  # GET /access_logs
  # GET /access_logs.json
  def index
    @access_logs = AccessLog.all
  end

  # GET /access_logs/1
  # GET /access_logs/1.json
  def show
  end

  # GET /access_logs/new
  def new
    @access_log = AccessLog.new
  end

  # GET /access_logs/1/edit
  def edit
  end

  # POST /access_logs
  # POST /access_logs.json
  def create
    @access_log = AccessLog.new(access_log_params)

    respond_to do |format|
      if @access_log.save
        format.html { redirect_to @access_log, notice: 'Access log was successfully created.' }
        format.json { render :show, status: :created, location: @access_log }
      else
        format.html { render :new }
        format.json { render json: @access_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /access_logs/1
  # PATCH/PUT /access_logs/1.json
  def update
    respond_to do |format|
      if @access_log.update(access_log_params)
        format.html { redirect_to @access_log, notice: 'Access log was successfully updated.' }
        format.json { render :show, status: :ok, location: @access_log }
      else
        format.html { render :edit }
        format.json { render json: @access_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /access_logs/1
  # DELETE /access_logs/1.json
  def destroy
    @access_log.destroy
    respond_to do |format|
      format.html { redirect_to access_logs_url, notice: 'Access log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_access_log
      @access_log = AccessLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def access_log_params
      params.require(:access_log).permit(:logged, :card_id, :door, :action, :detail)
    end
end
