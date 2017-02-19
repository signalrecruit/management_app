Rails.application.routes.draw do


get 'identifier/identify', to: 'identifier#identify', as: :identifier
post 'identifier/authenticate', to: 'identifier#authenticate'
devise_for :recruiters, controllers: { registrations: "recruiter/registrations", sessions: "recruiter/sessions" }
devise_for :companies, controllers: { registrations: "company/registrations", sessions: "company/sessions" }
  namespace :recruiter do
    root 'welcome#dashboard', as: :dashboard
    get 'welcome/charts_and_graphs', as: :charts_and_graphs
    get 'welcome/calendar', as: :calendar
    get 'requests/demo_requests', to: 'requests#demo_requests', as: :demo_requests
    get 'requests/:id/company_signup', to: 'requests#send_company_login_details', as: :company_signup
    patch 'requests/:id/accept_offer', to: 'requests#accept_offer', as: :company_accept_offer
    patch 'request/:id/reject_offer', to: 'requests#reject_offer', as: :company_reject_offer
    patch 'requests/:id/contact', to: 'requests#contact', as: :contact
    patch 'requests/:id/no_contact', to: 'requests#no_contact', as: :no_contact

    resources :requests, only: [:new, :create]

  end

  root 'welcome#landing_page'

  get 'company/company_dashboard', as: :company_dashboard
  get 'company/charts_and_graphs'
  get 'company/calendar'

  resources :requests, only: [:new, :create]
end
