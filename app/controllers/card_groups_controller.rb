class CardGroupsController < ApplicationController
  before_action :set_card_group, only: [:show, :edit, :update, :destroy]

  # GET /card_groups
  # GET /card_groups.json
  def index
    @card_groups = CardGroup.paginate(page: params[:page])
  end

  # GET /card_groups/1
  # GET /card_groups/1.json
  def show
  end

  # GET /card_groups/new
  def new
    @card_group = CardGroup.new
  end

  # GET /card_groups/1/edit
  def edit
  end

  # POST /card_groups
  # POST /card_groups.json
  def create
    @card_group = CardGroup.new(card_group_params)

    respond_to do |format|
      if @card_group.save
        format.html { redirect_to @card_group, notice: 'Card group was successfully created.' }
        format.json { render :show, status: :created, location: @card_group }
      else
        format.html { render :new }
        format.json { render json: @card_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_groups/1
  # PATCH/PUT /card_groups/1.json
  def update
    respond_to do |format|
      if @card_group.update(card_group_params)
        format.html { redirect_to @card_group, notice: 'Card group was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_group }
      else
        format.html { render :edit }
        format.json { render json: @card_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_groups/1
  # DELETE /card_groups/1.json
  def destroy
    @card_group.destroy
    respond_to do |format|
      format.html { redirect_to card_groups_url, notice: 'Card group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_group
      @card_group = CardGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_group_params
      params.require(:card_group).permit(:card_id, :access_group_id)
    end
end
