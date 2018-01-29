class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]
  before_action :fix_boolean_fields, :only => [:create, :update]

  def captured
    time = params[:capture_time]
    time = time.gsub(/GMT.*/,'UTC') if Rails.env.production?
    time = Time.parse(time)

    found = AccessLog.last_denied(time)

    if found && found.card_id
      render text: found.card_id
    else
      render text: "NOT FOUND"
    end
  end

  # GET /cards
  # GET /cards.json
  def index
    @q = Card.ransack(params[:q])
    @cards = @q.result.paginate(page: params[:page])
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
    @access_groups = @card.access_groups
    @access_logs = @card.access_logs.order("logged")
  end

  # GET /cards/new
  def new
    @card = Card.new
    @card.valid_from = 2.day.ago
    @card.expires    = 1.year.from_now

    @access_groups = AccessGroup.all
  end

  # GET /cards/1/edit
  def edit
    @access_groups = AccessGroup.all
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = Card.new(card_params)

    respond_to do |format|
      if @card.save
        format.html { redirect_to @card, notice: 'Card was successfully created.' }
        format.json { render :show, status: :created, location: @card }
      else
        @access_groups = AccessGroup.all
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to @card, notice: 'Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @card }
      else
        @access_groups = AccessGroup.all
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(
        :user, :nick, :after_hours, :expires, :valid_from, :disabled, :magic, access_group_ids: []
      )
    end

    ##
    # Boolean fields are saved as Y/N, not 0/1
    #*
    def fix_boolean_fields
      params[:card][:magic]       = params[:card][:magic] == '1' ? 'Y' : 'N'
      params[:card][:disabled]    = params[:card][:disabled] == '1' ? 'Y' : 'N'
      params[:card][:after_hours] = params[:card][:after_hours] == '1' ? 'Y' : 'N'
    end
end
