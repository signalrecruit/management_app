namespace :git do 
 task :push_to => [:status, :add, :commit, :push] do 
 end

 task :status do
   sh "git status"
 end

 task :add do 
   sh "git add ."
 end

 task :commit, [:commit_message] do |t, args|
   sh "git commit -m '#{args[:commit_message]}'"	
 end

 task :push, [:environment] do |t, args|
   sh "git push && git push #{args[:environment]}"	
 end
end 

namespace :gitcheckout do 
   desc "some rake tasks.."
   task :checkout, [:commit_message] => [:status, :add, :commit, :checkout_branch] do |t, args|
   end

   task :status do 
     sh "git status"
   end

   task :add do 
   	 sh "git add ."
   end

   task :commit, [:commit_message] do |t, args|
   	 begin
   	   sh "git commit -m '#{args[:commit_message]}'"
    rescue
   	  puts "files have already been committed"
     end
   end

   # task :checkout_branch, [:checkout_params] do |t, args|
   # 	 sh "git checkout #{args[:checkout_params]}"
   # end

   task :checkout_branch do 
     sh "git checkout #{args[ENV['BRANCH']]}"
   end
 end


 

