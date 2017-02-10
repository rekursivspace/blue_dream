Rails.application.routes.draw do
	get 'labels' => 'label#index'
	scope 'labels' do
		get ':label-slug' => 'label#show'
		scope ':label-slug' do
			get 'albums' => 'label#albums'
			get 'artists' => 'label#artists'
		end
	end

	get 'artists' => 'artist#index'
	scope 'artists' do
		get ':artist-slug' => 'artist#show'
		scope ':artist-slug' do
			get 'albums' => 'artist#albums'
			get 'tracks' => 'artist#tracks'
		end
	end
	
	get 'albums' => 'album#index'
	scope 'albums' do
		get ':catalog' => 'album#show'
		scope ':catalog' do
			get 'artist' => 'album#artist'
		end
	end

	get 'tracks' => 'track#index'
	scope 'tracks' do
		get ':track-uuid' => 'track#show'
		scope ':track-uuid' do
			get 'album' => 'track#album'
			get 'artist' => 'track#artist'
		end
	end
end
