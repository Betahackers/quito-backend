# # require_and_profile.rb
# def require_and_profile(gemname = nil)
#   unless gemname
#     puts "%-20s: %10s | %10s" % ['gem','increment','total']
#     return
#   end
#   # This is how to get memory of calling process in OS X, check host OS for variants
#   memory_usage = `ps -o rss= -p #{Process.pid}`.to_i / 1024.0
#   require gemname
#   puts "%-20s: %10.2f | %10.2f" % [ gemname, (`ps -o rss= -p #{Process.pid}`.to_i / 1024.0 - memory_usage), (`ps -o rss= -p #{Process.pid}`.to_i / 1024.0)]
# end
# 
# pattern = /^[^#]*gem[ ]*['"]([^,'"]*)['"][ ,~>0-9\.'"]*(:require[ => ]*['"]([^'"]*)['"][, ])?/
# 
# require_and_profile
# File.open('Gemfile').each do |line|
#   if line.match(pattern)
#   if line.match(pattern)[3]
#     require_and_profile line.match(pattern)[3]
#   else
#       require_and_profile line.match(pattern)[1]
#     end
#   end
# end