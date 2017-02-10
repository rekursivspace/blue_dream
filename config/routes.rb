Rails.application.routes.draw do
	get 'labels' => 'labels#index'
	scope 'labels' do
		get ':uuid' => 'labels#show'
		scope ':uuid' do
			get 'albums' => 'labels#albums'
			get 'artists' => 'labels#artists'
		end
	end

	get 'artists' => 'artists#index'
	scope 'artists' do
		get ':uuid' => 'artists#show'
		scope ':uuid' do
			get 'albums' => 'artists#albums'
			get 'tracks' => 'artists#tracks'
		end
	end
	
	get 'albums' => 'albums#index'
	scope 'albums' do
		get ':uuid' => 'albums#show'
		scope ':uuid' do
			get 'artist' => 'albums#artist'
		end
	end

	get 'tracks' => 'tracks#index'
	scope 'tracks' do
		get ':uuid' => 'tracks#show'
		scope ':uuid' do
			get 'album' => 'tracks#album'
			get 'artist' => 'tracks#artist'
		end
	end
end
