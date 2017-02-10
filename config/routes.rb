Rails.application.routes.draw do

devise_for :companies, controllers: { registrations: "registrations" }
  namespace :recruiter do
    root 'welcome#dashboard'
  end

  root 'welcome#landing_page'

  get 'company/company_dashboard', as: :company_dashboard
  get 'company/charts_and_graphs'
end
