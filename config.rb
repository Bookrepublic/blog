###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Post
###

data.articles.articles.each do |post|
  proxy "/consigli-di-lettura/#{post[:slug]}.html", "/consigli-di-lettura/consigli.html", ignore: true, locals: { p: post }
end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Slim
Slim::Engine.set_options format: :html
Slim::Engine.set_default_options pretty: false

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Autoprefixer
activate :autoprefixer do |config|
  config.browsers = ['last 3 versions', 'Explorer >= 9']
  config.cascade = true
  config.inline = true
end

###
#Es6
###

activate :es6

# Assetes
set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'

# Heroku
set :build_dir, 'tmp'

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :minify_html, remove_intertag_spaces: true
end
