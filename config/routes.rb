Rails.application.routes.draw do

  get 'identifier/identify', to: 'identifier#identify', as: :identifier
  post 'identifier/authenticate', to: 'identifier#authenticate'
  devise_for :recruiters, controllers: { registrations: "recruiter/registrations", sessions: "recruiter/sessions" }
  devise_for :companies, controllers: { registrations: "company/registrations", sessions: "company/sessions" }

  namespace :recruiter do
    root 'welcome#dashboard', as: :dashboard
    get 'welcome/charts_and_graphs', to: 'welcome#charts_and_graphs', as: :charts_and_graphs
    get 'welcome/calendar', to: 'welcome#calendar', as: :calendar
    get 'requests/demo_requests', to: 'requests#demo_requests', as: :demo_requests
    get 'requests/:id/company_signup', to: 'requests#send_company_login_details', as: :company_signup
    patch 'requests/:id/accept_offer', to: 'requests#accept_offer', as: :company_accept_offer
    patch 'request/:id/reject_offer', to: 'requests#reject_offer', as: :company_reject_offer
    patch 'requests/:id/contact', to: 'requests#contact', as: :contact
    patch 'requests/:id/no_contact', to: 'requests#no_contact', as: :no_contact

    get 'manage_companies/list_of_companies', to: 'manage_companies#list_of_companies', as: :list_of_companies
    get 'manage_companies/:id/company_job_descriptions', to: 'manage_companies#company_job_descriptions', as: :company_job_descriptions
    get 'manage_companies/:id/company_history_of_applicants', to: 'manage_companies#company_history_of_applicants', as: :company_history_of_applicants

    get 'applicant_details/:id/match_job_description', to: 'applicant_details#match_job_description', as: :match_job_description
    patch 'applicant_details/:id/send_company_applicant_details', to: 'applicant_details#send_company_applicant_details', as: :send_company_applicant_details
    patch 'events/:id/send_schedule', to: 'events#send_schedule', as: :send_schedule

    patch 'events/:id/pass_interview', to: 'events#pass_interview', as: :pass_interview
    patch 'events/:id/fail_interview', to: 'events#fail_interview', as: :fail_interview
    patch 'events/:id/interview_pending', to: 'events#interview_pending', as: :interview_pending


    resources :requests, only: [:new, :create]
    resources :requirements
    
    resources :applicant_details do 
      resources :scores, only: [:new, :show, :create, :edit, :update]
      resources :experiences
      resources :events, except: [:index]
    end    
    resources :events, only: [:index]
  end


  namespace :company do 
    root 'welcome#dashboard', as: :dashboard
    get 'welcome/charts_and_graphs', to: 'welcome#charts_and_graphs', as: :charts_and_graphs
    get 'welcome/calendar', to: 'welcome#calendar', as: :calendar
    
    get 'requirements/:id/send_requirements',to: 'requirements#send_requirements', as: :send_requirements

    patch 'applicant_details/:id/accept_applicant', to: 'applicant_details#accept_applicant', as: :accept_applicant
    patch 'applicant_details/:id/reject_applicant', to: 'applicant_details#reject_applicant', as: :reject_applicant
    patch 'applicant_details/:id/send_recruiter_applicant_details', to: 'applicant_details#send_recruiter_applicant_details', as: :send_recruiter_applicant_details

    patch 'events/:id/confirm_schedule', to: 'events#confirm_schedule', as: :confirm_schedule
    patch 'events/:id/reject_schedule', to: 'events#reject_schedule', as: :reject_schedule

    patch 'events/:id/choose_recruiter', to: 'events#choose_recruiter', as: :choose_recruiter
    patch 'events/:id/choose_company', to: 'events#choose_company', as: :choose_company
    patch 'events/:id/pass_interview', to: 'events#pass_interview', as: :pass_interview
    patch 'events/:id/fail_interview', to: 'events#fail_interview', as: :fail_interview
    patch 'events/:id/interview_pending', to: 'events#interview_pending', as: :interview_pending

    resources :requirements
    resources :requirements, only: [] do
      resources :compulsory_requirements, only: [:show, :new, :create, :edit, :update, :destroy]
    end
    
   
    resources :applicant_details, only: [:index, :show, :update]
    # resources :applicant_details, only: [] do 
    #   resources :events, except: [:index]
    # end
    resources :events
    
  end

  root 'welcome#landing_page'
  resources :requests, only: [:new, :create]
end
