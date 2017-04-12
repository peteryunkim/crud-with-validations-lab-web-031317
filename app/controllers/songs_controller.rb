class SongsController < ApplicationController

	def index
		@songs = Song.all
	end

	def show
		song_setter
	end

	def new
		@song = Song.new
	end

	def create
		@song = Song.new(song_params(:title, :artist_name, :released, :release_year, :genre))
			if @song.valid?
				@song.save
				redirect_to song_path(@song)
			else
				render :new
			end
	end

	def edit
		song_setter
	end

	def update
		song_setter
		@song.assign_attributes(song_params(:title, :artist_name, :released, :release_year, :genre))
		if @song.valid?
			@song.update(song_params(:title, :artist_name, :released, :release_year))
			redirect_to song_path(@song)
		else
			render :edit
		end
	end

	def destroy
		song_setter.destroy
		redirect_to songs_url
	end



private

	def song_params(*args)
		params.require(:song).permit(*args)
	end

	def song_setter
		@song = Song.find(params.require(:id))
	end
end
