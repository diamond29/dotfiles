require 'rake'
require 'fileutils'

task :default => [:move_dot_files] do
  puts "Enjoy!"
end

task :move_dot_files do
  Dir.glob('.*').each do |file|
    FileUtils.cp_r(file, File.expand_path("~/")) unless file =~ /\.$|^\.git$/
  end
end
