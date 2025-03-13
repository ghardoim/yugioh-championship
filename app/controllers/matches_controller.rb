class MatchesController < ApplicationController
  before_action :set_match, only: %i[ show edit update destroy ]

  # GET /matches or /matches.json
  def index
    @matches = Match.all
  end

  # GET /matches/1 or /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @players = Player.all.to_a.combination(2).to_a
    @matches = @players.map do |p1, p2|
      Match.new(player_1: p1, player_2: p2 )
    end
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches or /matches.json
  def create
    @matches = params[:match][:matches].map do |params|
      Match.new(params.permit(:player_1_id, :player_2_id, :wins1, :wins2))
    end

    if @matches.all?(&:valid?)
      @matches.each(&:save)
      format.html { redirect_to @match, notice: "Match was successfully created." }
      format.json { render :show, status: :created, location: @match }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @match.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /matches/1 or /matches/1.json
  def update
    
    respond_to do |format|
      puts format
      if @match.update(params[:match][:matches][0])
        format.html { redirect_to match_path, notice: "Match was successfully updated." }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1 or /matches/1.json
  def destroy
    @match.destroy!

    respond_to do |format|
      format.html { redirect_to matches_path, status: :see_other, notice: "Match was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def match_params
      params.expect(match: [ :player_1_id, :player_2_id, :wins1, :wins2 ])
    end
end
