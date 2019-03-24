# == Route Map
#
#                      Prefix Verb   URI Pattern                                                                              Controller#Action
#         song_searches_index GET    /song_searches/index(.:format)                                                           song_searches#index
#          song_searches_show GET    /song_searches/show(.:format)                                                            song_searches#show
#              searches_index GET    /searches/index(.:format)                                                                searches#index
#               searches_show GET    /searches/show(.:format)                                                                 searches#show
#            new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
#                user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
#        destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
#           new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
#          edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
#               user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
#                             PUT    /users/password(.:format)                                                                devise/passwords#update
#                             POST   /users/password(.:format)                                                                devise/passwords#create
#    cancel_user_registration GET    /users/cancel(.:format)                                                                  devise/registrations#cancel
#       new_user_registration GET    /users/sign_up(.:format)                                                                 devise/registrations#new
#      edit_user_registration GET    /users/edit(.:format)                                                                    devise/registrations#edit
#           user_registration PATCH  /users(.:format)                                                                         devise/registrations#update
#                             PUT    /users(.:format)                                                                         devise/registrations#update
#                             DELETE /users(.:format)                                                                         devise/registrations#destroy
#                             POST   /users(.:format)                                                                         devise/registrations#create
#          authenticated_root GET    /                                                                                        welcome#index
#        unauthenticated_root GET    /                                                                                        devise/sessions#new
#                    tab_show GET    /tab/show(.:format)                                                                      tab#show
#                  tab_create GET    /tab/create(.:format)                                                                    tab#create
#               welcome_index GET    /welcome/index(.:format)                                                                 welcome#index
#                  song_notes GET    /songs/:song_id/notes(.:format)                                                          notes#index
#                             POST   /songs/:song_id/notes(.:format)                                                          notes#create
#               new_song_note GET    /songs/:song_id/notes/new(.:format)                                                      notes#new
#              edit_song_note GET    /songs/:song_id/notes/:id/edit(.:format)                                                 notes#edit
#                   song_note GET    /songs/:song_id/notes/:id(.:format)                                                      notes#show
#                             PATCH  /songs/:song_id/notes/:id(.:format)                                                      notes#update
#                             PUT    /songs/:song_id/notes/:id(.:format)                                                      notes#update
#                             DELETE /songs/:song_id/notes/:id(.:format)                                                      notes#destroy
#                       songs GET    /songs(.:format)                                                                         songs#index
#                artist_songs GET    /artists/:artist_id/songs(.:format)                                                      songs#index
#                             POST   /artists/:artist_id/songs(.:format)                                                      songs#create
#             new_artist_song GET    /artists/:artist_id/songs/new(.:format)                                                  songs#new
#            edit_artist_song GET    /artists/:artist_id/songs/:id/edit(.:format)                                             songs#edit
#                 artist_song GET    /artists/:artist_id/songs/:id(.:format)                                                  songs#show
#                             PATCH  /artists/:artist_id/songs/:id(.:format)                                                  songs#update
#                             PUT    /artists/:artist_id/songs/:id(.:format)                                                  songs#update
#                             DELETE /artists/:artist_id/songs/:id(.:format)                                                  songs#destroy
#                     artists GET    /artists(.:format)                                                                       artists#index
#                             POST   /artists(.:format)                                                                       artists#create
#                  new_artist GET    /artists/new(.:format)                                                                   artists#new
#                 edit_artist GET    /artists/:id/edit(.:format)                                                              artists#edit
#                      artist GET    /artists/:id(.:format)                                                                   artists#show
#                             PATCH  /artists/:id(.:format)                                                                   artists#update
#                             PUT    /artists/:id(.:format)                                                                   artists#update
#                             DELETE /artists/:id(.:format)                                                                   artists#destroy
#     resource_resource_notes GET    /resources/:resource_id/resource_notes(.:format)                                         resource_notes#index
#                             POST   /resources/:resource_id/resource_notes(.:format)                                         resource_notes#create
#  new_resource_resource_note GET    /resources/:resource_id/resource_notes/new(.:format)                                     resource_notes#new
# edit_resource_resource_note GET    /resources/:resource_id/resource_notes/:id/edit(.:format)                                resource_notes#edit
#      resource_resource_note GET    /resources/:resource_id/resource_notes/:id(.:format)                                     resource_notes#show
#                             PATCH  /resources/:resource_id/resource_notes/:id(.:format)                                     resource_notes#update
#                             PUT    /resources/:resource_id/resource_notes/:id(.:format)                                     resource_notes#update
#                             DELETE /resources/:resource_id/resource_notes/:id(.:format)                                     resource_notes#destroy
#                   resources GET    /resources(.:format)                                                                     resources#index
#                             POST   /resources(.:format)                                                                     resources#create
#                new_resource GET    /resources/new(.:format)                                                                 resources#new
#               edit_resource GET    /resources/:id/edit(.:format)                                                            resources#edit
#                    resource GET    /resources/:id(.:format)                                                                 resources#show
#                             PATCH  /resources/:id(.:format)                                                                 resources#update
#                             PUT    /resources/:id(.:format)                                                                 resources#update
#                             DELETE /resources/:id(.:format)                                                                 resources#destroy
#                        root GET    /                                                                                        welcome#index
#          rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#   rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#          rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#   update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#        rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  get 'song_searches/index'
  get 'song_searches/show'
  get 'searches/index'
  get 'searches/show'
  devise_for :users
  
  devise_scope :user do
    authenticated :user do
      root 'welcome#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  get 'tab/show'
  get 'tab/create'
  get 'welcome/index'

  resources :songs, only: [:index] do
    resources :notes
  end
  
  resources :artists do
    resources :songs 
  end

  resources :resources do
    resources :resource_notes
  end
  
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
