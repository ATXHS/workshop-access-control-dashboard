class DoorAccessController < ApplicationController
  before_action :set_door_access, only: [:show, :edit, :update, :destroy]

  # GET /door_access
  # GET /door_access.json
  def index
    @door_accesses = DoorAccess.all
  end

  # GET /door_access/1
  # GET /door_access/1.json
  def show
  end

  # GET /door_access/new
  def new
    @door_access = DoorAccess.new
  end

  # GET /door_access/1/edit
  def edit
  end

  # POST /door_access
  # POST /door_access.json
  def create
    @door_access = DoorAccess.new(door_access_params)

    respond_to do |format|
      if @door_access.save
        format.html { redirect_to @door_access, notice: 'Door access was successfully created.' }
        format.json { render :show, status: :created, location: @door_access }
      else
        format.html { render :new }
        format.json { render json: @door_access.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /door_access/1
  # PATCH/PUT /door_access/1.json
  def update
    respond_to do |format|
      if @door_access.update(door_access_params)
        format.html { redirect_to @door_access, notice: 'Door access was successfully updated.' }
        format.json { render :show, status: :ok, location: @door_access }
      else
        format.html { render :edit }
        format.json { render json: @door_access.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /door_access/1
  # DELETE /door_access/1.json
  def destroy
    @door_access.destroy
    respond_to do |format|
      format.html { redirect_to door_access_url, notice: 'Door access was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_door_access
      @door_access = DoorAccess.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def door_access_params
      params.require(:door_access).permit(:door_id, :access_group_id)
    end
end
