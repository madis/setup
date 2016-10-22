#!/usr/bin/env ruby

require 'rake'
require 'fileutils'
class Helpers
	class << self
		def dotfiles(file)
		  File.expand_path(file, File.expand_path('dotfiles', File.dirname(__FILE__)))
		end

		def home(file)
		  File.expand_path(file, '~')
		end
		
		def user_confirms?(*context)
		  print "'#{context.join(' ')}' (yes/no) "
		  $stdin.gets.chomp == 'yes'
		end

		def symlink(source, target=".#{source}")
		  puts "Symlinking #{dotfiles(source)} -> #{home(target)}"
		  if File.exist?(home(target)) && user_confirms?("Overwrite", home(target))
		    FileUtils.ln_sf dotfiles(source), home(target)
		  else
		    FileUtils.ln_s dotfiles(source), home(target)
		  end

		end
	end
end

desc 'Link dotfiles to appropriate positions in the system'
task :install do
  Helpers.symlink 'bashrc'
  Helpers.symlink 'bash_login'
  Helpers.symlink 'gemrc'
  Helpers.symlink 'vimrc'
  Helpers.symlink 'vimrc', '.config/nvim/init.vim'
  Helpers.symlink 'gitignore'
end
