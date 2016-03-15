# Load the Rails application.
require File.expand_path('../application', __FILE__)

#### From  www.williambharding.com/blog/rails/automatically-reload-modules-on-change-in-rails/
#config.autoload_paths += %W( #{RAILS_ROOT}/lib/common )
################################################################################

# Initialize the Rails application.
PHIL="the greatest"
ENV["dfr"]="Yet another way"
Rails.application.initialize!
