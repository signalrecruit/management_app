require 'rails_helper'

RSpec.describe CompanySignupJob, type: :job do
  include ActiveJob::TestHelper

  before do 
  	@company = FactoryGirl.create :company
  	@secure_password = SecureRandom.hex(5)
  	@url = "some url"
  end

  subject (:job) { CompanySignupJob.perform_later(@company, @secure_password, @url) }

  it "queues the job" do 
    expect{
      job
    }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)	
  end

  it "it is in default queue" do 
    expect(CompanySignupJob.queue_name).to eq ("default")	
  end

  it "executes perform_later" do 
  	message_delivery = instance_double(ActionMailer::MessageDelivery)
    expect(CompanySignupMailer).to receive(:signup_company).with(@company, @secure_password, @url).and_return(message_delivery)
    allow(message_delivery).to receive(:deliver_later)
    perform_enqueued_jobs { job }
  end


  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end
end
