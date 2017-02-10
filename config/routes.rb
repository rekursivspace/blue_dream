Rails.application.routes.draw do
	get 'labels' => 'labels#index'
	scope 'labels' do
		get ':uuid' => 'labels#show'
		scope ':uuid' do
			get 'albums' => 'labels#albums'
			get 'artists' => 'labels#artists'
		end
	end

	get 'artists' => 'artist#index'
	scope 'artists' do
		get ':uuid' => 'artist#show'
		scope ':uuid' do
			get 'albums' => 'artist#albums'
			get 'tracks' => 'artist#tracks'
		end
	end
	
	get 'albums' => 'album#index'
	scope 'albums' do
		get ':uuid' => 'album#show'
		scope ':uuid' do
			get 'artist' => 'album#artist'
		end
	end

	get 'tracks' => 'track#index'
	scope 'tracks' do
		get ':uuid' => 'track#show'
		scope ':uuid' do
			get 'album' => 'track#album'
			get 'artist' => 'track#artist'
		end
	end
end
