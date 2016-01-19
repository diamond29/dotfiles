require 'rake'
require 'fileutils'

desc "Just move dot files"
task :default => [:move_dot_files, :setup_neovim]

desc "Install all tools"
task :install_tools => [:install_pyenv, :install_npm, :install_vim]

desc "Move all dot files to home dir"
task :move_dot_files do
  Dir.glob('.*').each do |file|
    unless ignored_file?(file) || handle_special_case(file)
      destination = File.expand_path("~/#{file}")
      FileUtils.rm_rf destination if File.exists?(destination) || Dir.exists?(destination)
      File.symlink(File.expand_path(file), destination)
    end
  end
end

# https://wiki.archlinux.org/index.php/Neovim
desc "setup neovim"
task :setup_neovim do
  sh(
    'mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config} && '\
    'ln -f -s ~/.vim $XDG_CONFIG_HOME/nvim && '\
    'ln -f -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim'
  )
end

desc "Install pyenv for python"
task :install_pyenv do
  sh "curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | (export USE_HTTPS=true && bash)"
  sh "pyenv update"
end

desc "Install node/npm"
task :install_npm do
  fail "Not implemented for non-ubuntu" unless ubuntu?
  sh "sudo apt-get install -y nodejs"
  sh "sudo ln -s /usr/bin/nodejs /usr/bin/node"
  sh "sudo npm install -g bower"
end

desc "Install vim"
task :install_vim do
  if ubuntu?
    sh "sudo apt-get install -y vim-gnome"
  end
end

def handle_special_case(file_dir)
  if file_dir == '.i3' && ubuntu?
    FileUtils.cp_r(file_dir, File.expand_path("~/"))
    config_file = File.expand_path('~/.i3/config')
    IO.write(config_file, IO.read(config_file).gsub("urxvt -cd \"`xcwd`\"", "gnome-terminal --working-directory=`xcwd`"))
    true
  else
    false
  end
end

def ignored_file?(file_dir)
  file_dir =~ /\.$|^\.git$/
end

def ubuntu?
  `lsb_release -a 2>&1`.downcase.include?('ubuntu')
end
