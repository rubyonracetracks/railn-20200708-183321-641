# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#         new_admin_session GET    /admins/sign_in(.:format)                                                                devise/sessions#new
#             admin_session POST   /admins/sign_in(.:format)                                                                devise/sessions#create
#     destroy_admin_session DELETE /admins/sign_out(.:format)                                                               devise/sessions#destroy
#        new_admin_password GET    /admins/password/new(.:format)                                                           devise/passwords#new
#       edit_admin_password GET    /admins/password/edit(.:format)                                                          devise/passwords#edit
#            admin_password PATCH  /admins/password(.:format)                                                               devise/passwords#update
#                           PUT    /admins/password(.:format)                                                               devise/passwords#update
#                           POST   /admins/password(.:format)                                                               devise/passwords#create
# cancel_admin_registration GET    /admins/cancel(.:format)                                                                 devise/registrations#cancel
#    new_admin_registration GET    /admins/sign_up(.:format)                                                                devise/registrations#new
#   edit_admin_registration GET    /admins/edit(.:format)                                                                   devise/registrations#edit
#        admin_registration PATCH  /admins(.:format)                                                                        devise/registrations#update
#                           PUT    /admins(.:format)                                                                        devise/registrations#update
#                           DELETE /admins(.:format)                                                                        devise/registrations#destroy
#                           POST   /admins(.:format)                                                                        devise/registrations#create
#    new_admin_confirmation GET    /admins/confirmation/new(.:format)                                                       devise/confirmations#new
#        admin_confirmation GET    /admins/confirmation(.:format)                                                           devise/confirmations#show
#                           POST   /admins/confirmation(.:format)                                                           devise/confirmations#create
#          new_admin_unlock GET    /admins/unlock/new(.:format)                                                             devise/unlocks#new
#              admin_unlock GET    /admins/unlock(.:format)                                                                 devise/unlocks#show
#                           POST   /admins/unlock(.:format)                                                                 devise/unlocks#create
#          new_user_session GET    /users/sign_in(.:format)                                                                 users/sessions#new
#              user_session POST   /users/sign_in(.:format)                                                                 users/sessions#create
#      destroy_user_session DELETE /users/sign_out(.:format)                                                                users/sessions#destroy
#         new_user_password GET    /users/password/new(.:format)                                                            users/passwords#new
#        edit_user_password GET    /users/password/edit(.:format)                                                           users/passwords#edit
#             user_password PATCH  /users/password(.:format)                                                                users/passwords#update
#                           PUT    /users/password(.:format)                                                                users/passwords#update
#                           POST   /users/password(.:format)                                                                users/passwords#create
#  cancel_user_registration GET    /users/cancel(.:format)                                                                  users/registrations#cancel
#     new_user_registration GET    /users/sign_up(.:format)                                                                 users/registrations#new
#    edit_user_registration GET    /users/edit(.:format)                                                                    users/registrations#edit
#         user_registration PATCH  /users(.:format)                                                                         users/registrations#update
#                           PUT    /users(.:format)                                                                         users/registrations#update
#                           DELETE /users(.:format)                                                                         users/registrations#destroy
#                           POST   /users(.:format)                                                                         users/registrations#create
#     new_user_confirmation GET    /users/confirmation/new(.:format)                                                        users/confirmations#new
#         user_confirmation GET    /users/confirmation(.:format)                                                            users/confirmations#show
#                           POST   /users/confirmation(.:format)                                                            users/confirmations#create
#           new_user_unlock GET    /users/unlock/new(.:format)                                                              devise/unlocks#new
#               user_unlock GET    /users/unlock(.:format)                                                                  devise/unlocks#show
#                           POST   /users/unlock(.:format)                                                                  devise/unlocks#create
#                      root GET    /                                                                                        static_pages#home
#                     about GET    /about(.:format)                                                                         static_pages#about
#                   contact GET    /contact(.:format)                                                                       static_pages#contact
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :admins

  # BEGIN: user section
  devise_for :users,
             controllers: { registrations: 'users/registrations',
                            sessions: 'users/sessions',
                            passwords: 'users/passwords',
                            confirmations: 'users/confirmations' }
  # END: user section

  # BEGIN: static pages
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  # END: static pages
end
