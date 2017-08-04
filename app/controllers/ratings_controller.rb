class RatingsController < ApplicationController
  before_filter :set_song

  def create
    @rating = @song.ratings.new :rate => params[:rate]
    if @rating.save
      redirect_to song_ratings_path(@song), :notice => "Rating successful."
    else
      redirect_to song_ratings_path(@song), :notice => "Something went wrong."
    end
  end

  def update
    @rating = Rating.find(params[:id])
    @rating.update_attribute :rate, params[:rate]
  end

  private
    def set_song
      @song = song.find(parms[:song_id])
    end
end
