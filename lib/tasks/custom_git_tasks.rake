namespace :git do 
  desc "to checkout into an existing branch, rake git:checkout['message'] BRANCH=branch_name"
  task :checkout, [:commit_message] => [:status, :add, :commit, :checkout_branch, :current_branch] do |t, args|
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

  task :push_to_production do 
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
end


# write tasks for heroku commands, merges for branches
 

# write tasks to discard branch
