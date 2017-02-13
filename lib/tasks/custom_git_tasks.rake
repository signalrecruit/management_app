namespace :git do 
  desc "some rake tasks.."
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

  task :push do 
    sh "git push #{ENV['HEROKU_REMOTE']} #{ENV['GIT_BRANCH']}:master"
  end

  task :delete_branch, [:commit_message] => [:add, :commit, :checkout, :delete] do    
  end

  task :delete do
    sh "git branch -D #{ENV['DELETE_BRANCH']}"
    puts "#{ENV['DELETE_BRANCH']} deleted!"
  end
end


# write tasks for heroku commands, merges for branches
 

# write tasks to discard branch
