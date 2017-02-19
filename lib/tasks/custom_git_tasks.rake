namespace :git do 

  desc "to checkout into an existing branch, rake git:checkout['message'] BRANCH=branch_name"
  task :checkout, [:commit_message] => [:status, :add, :commit, :checkout_branch, :current_branch] do |t, args|
  end

  desc "to checkout and merge, rake git:checkout_and_merge['commit message'] BRANCH=branch_name MERGE_BRANCH=merge_branch_name"
  task :checkout_and_merge, [:commit_message] => [:status, :add, :commit, :checkout_branch, :merge_branch] do 
    puts "checkout and merge successful!"  
  end

  task :merge_branch do 
    sh "git merge #{ENV['MERGE_BRANCH']}"
  end

  task :commit_changes, [:commit_message] => [:add, :commit] do 
    puts "changes committed to... "
    sh "git rev-parse --abbrev-ref HEAD"
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

  task :checkout_branch do 
    sh "git checkout #{ENV['BRANCH']}"
  end

  task :current_branch do 
  	print "NOTE!!! YOUR CURRENT BRANCH IS <<<"
  	sh "git rev-parse --abbrev-ref HEAD"
  	print ">>>"
  end



  desc "push to production and run migration, rake git:push_to_production['commit_message'] APP_NAME=app_name"
  task :push_to_production => [:migrate_production_database] do 
    sh "heroku run rake db:migrate --app #{ENV['APP_NAME']}"
  end

  task :migrate_production_database do 
    sh "git push #{ENV['HEROKU_REMOTE']} #{ENV['GIT_BRANCH']}:master"
  end

  
  
  desc "to delete an experimental branch, rake git:delete_branch['message'] BRANCH=branch_name DELETE_BRANCH=branch_name"
  task :delete_branch, [:commit_message] => [:add, :commit, :checkout, :delete] do    
  end

  task :delete do
    sh "git branch -D #{ENV['DELETE_BRANCH']}"
    puts "#{ENV['DELETE_BRANCH']} deleted!"
  end

  

  desc "to checkout into a new branch, rake git:checkout_new['message'] NEW_BRANCH=branch_name"
  task :checkout_new, [:commit_message] => [:add, :commit, :new_checkout] do 
  end

  task :new_checkout do 
    sh "git checkout -b #{ENV['NEW_BRANCH']}"
    puts "new branch #{ENV['NEW_BRANCH']} created!"  
  end
  
  

  desc "merge and delete experimental branch? rake git:merge_and_delete['message'] BRANCH=branch_name DELETE_BRANCH=branch_name"
  task :merge_and_delete, [:commit_message] => [:add, :commit, :checkout, :merge, :delete] do
    puts "#{ENV['DELETE_BRANCH']} merged with #{ENV['BRANCH']} followed by deletion"
  end

  task :merge do 
    sh "git merge #{ENV['DELETE_BRANCH']}"
  end

  desc "checkout and delete"
  task :checkout_and_delete, [:commit_message] => [:add, :commit, :checkout, :delete] do 
    puts "#{ENV['DELETE_BRANCH']} deleted! your current branch is #{ENV['BRANCH']}"
  end

  desc "run db:migrate on heroku, rake git:migrate_on_production APP_NAME=herokuapp_name"
  task :migrate_on_production do
    sh "heroku run rake db:migrate --app APP_NAME"
  end

  desc "restart heroku server"
  task :restart_dyno do 
    sh "heroku restart --app APP_NAME"
  end
end


# write tasks for heroku commands, merges for branches
 

# write tasks to discard branch

