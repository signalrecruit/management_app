Rails.application.routes.draw do

# devise_for :companies
  namespace :recruiter do
    root 'welcome#dashboard'
  end

  root 'welcome#landing_page'

  get 'company/company_dashboard', as: :company_dashboard
end
