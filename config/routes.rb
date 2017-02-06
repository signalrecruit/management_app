Rails.application.routes.draw do
  root 'welcome#landing_page'

  get 'company/company_dashboard', as: :company_dashboard
end
