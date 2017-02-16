Rails.application.routes.draw do

  get 'requests/new'

  get 'requests/create'

devise_for :companies, controllers: { registrations: "registrations" }
  namespace :recruiter do
    root 'welcome#dashboard', as: :dashboard
    get 'welcome/charts_and_graphs', as: :charts_and_graphs
  end

  root 'welcome#landing_page'

  get 'company/company_dashboard', as: :company_dashboard
  get 'company/charts_and_graphs'
  get 'company/calendar'

  resources :requests
end
