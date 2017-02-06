# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( welcome.css )
Rails.application.config.assets.precompile += %w( welcome.js )
Rails.application.config.assets.precompile += %w(welcome/bootstrap.js)
Rails.application.config.assets.precompile += %w(welcome/jquery-min.js)
Rails.application.config.assets.precompile += %w(welcome/main.js)
Rails.application.config.assets.precompile += %w(welcome/wow.js)

Rails.application.config.assets.precompile += %w(company.css)
Rails.application.config.assets.precompile += %w(company.js)

Rails.application.config.assets.precompile += %w(recruiter.css)
Rails.application.config.assets.precompile += %w(recruiter.js)





