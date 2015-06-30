require 'rake'
require 'fileutils'

desc "Set up a linux machine to match greg's configurations"
task :default => [:move_dot_files] do
  puts "Enjoy!"
end

desc "Move all dot files to home dir"
task :move_dot_files do
  Dir.glob('.*').each do |file|
    FileUtils.cp_r(file, File.expand_path("~/")) unless file =~ /\.$|^\.git$/
  end
end
