class ChallengeDataController < ApplicationController
  before_filter :set_challenge_datum, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @challenge_data = ChallengeDatum.all
    respond_with(@challenge_data)
  end

  def show
    respond_with(@challenge_datum)
  end

  def new
    @challenge_datum = ChallengeDatum.new
    respond_with(@challenge_datum)
  end

  def edit
  end

  def create
    @challenge_datum = ChallengeDatum.new(params[:challenge_datum])
    @challenge_datum.save
    respond_with(@challenge_datum)
  end

  def update
    @challenge_datum.update_attributes(params[:challenge_datum])
    respond_with(@challenge_datum)
  end

  def destroy
    @challenge_datum.destroy
    respond_with(@challenge_datum)
  end

  private
    def set_challenge_datum
      @challenge_datum = ChallengeDatum.find(params[:id])
    end
end
