class Admin::PreferencesController < ApplicationController
  before_action :set_preference, only: [:index, :update]

  def index
  end

  def update
    if @preference.update(preference_params) 
      redirect_to admin_preferences_path 
    else
      render :edit
    end
  end

  private

  def set_preference
    @preference = Preference.first
  end

  def preference_params
    params.require(:preference).permit(:song_sort_order, :artist_sort_order, :allow_create_songs, :allow_create_artists)
  end
end
