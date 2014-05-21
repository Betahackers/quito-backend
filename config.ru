# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
use Rack::Static, :urls => ['/carrierwave'], :root => 'tmp' # adding this line
run Rails.application

if Integer(ENV['UNICORN_KILLER'] || 0) != 0
  require 'unicorn/worker_killer'
  # # Max memory size (RSS) per worker
  # use Unicorn::WorkerKiller::Oom, (350*(1024**2)), (400*(1024**2)), 30, true
end