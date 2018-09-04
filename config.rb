###
# Blog settings
###

# Time.zone = "UTC"

activate :blog do |blog|
  blog.prefix = "news"
  blog.name = "news"
  blog.permalink = "{year}/{month}/{day}/{title}.html"
  blog.taglink = "tags/{tag}.html"
  blog.layout = "post"
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"
  blog.paginate = true
end

page "feed.xml", layout: false

activate :blog do |blog|
  blog.prefix = "people"
  blog.name = "people"
  blog.permalink = "{firstname}.html"
  blog.calendar_template = "calendar.html"
  blog.sources = "{firstname}-{lastname}.html"
end

activate :blog do |blog|
  blog.prefix = "research"
  blog.name = "research"
  blog.permalink = "{year}/{title}.html"
  blog.taglink = "tags/{tag}.html"
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"
end

activate :syntax

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, '/assets/stylesheets'

set :js_dir, '/assets/javascripts'

set :images_dir, 'images'

set :relative_links, true

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

activate :deploy do |deploy|
  #deploy.method   = :rsync
  deploy.method   = :sftp
  deploy.build_before    = true
  #deploy.host            = 'childlab.northwestern.edu'
  deploy.host            = 'mizar.usc.edu' 
  deploy.port            = 22
  #deploy.path            = '/var/www/html/childlab/'
  deploy.path            = '/home/usc/02/d-semant/public_html'
  # deploy.flags           = "--omit-dir-times --inplace -rve 'ssh' -a"
  # Optional Settings
  deploy.user     = 'd-semant' # no default
  deploy.password = 'secret' # no default
end