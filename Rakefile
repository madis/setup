#!/usr/bin/env ruby

require 'rake'
require 'fileutils'

class Helpers
  def self.help(&block)
    Helpers.new.instance_eval(&block)
  end

  def dry_run?
    false
  end

  def dotfiles(file)
    File.expand_path(file, File.expand_path('dotfiles', File.dirname(__FILE__)))
  end

  def bin(file)
    File.expand_path(file, File.expand_path('bin', File.dirname(__FILE__)))
  end

  def home(file)
    File.expand_path(file, '~')
  end

  def user_confirms?(*context)
    print "'#{context.join(' ')}' (yes/no) "
    $stdin.gets.chomp == 'yes'
  end

  # Create a symlink from source to target (users home folder)
  # Default target is to prefix source with '.'
  def symlink(source, target=".#{source}")
    puts "Symlinking #{dotfiles(source)} -> #{home(target)}"
    if File.exist?(home(target))
      if user_confirms?("Overwrite", home(target))
        FileUtils.ln_sf dotfiles(source), home(target) unless dry_run?
      else
        puts "Skipping #{source}"
      end
    else
      FileUtils.ln_sf dotfiles(source), home(target) unless dry_run?
    end
  end
end

desc 'Link dotfiles to appropriate positions in the system'
task :install do
  Helpers.help do
    symlink 'bashrc'
    symlink 'bash_login'
    symlink 'gemrc'
    symlink 'vimrc'
    symlink 'vimrc', '.config/nvim/init.vim'
    symlink 'gitignore_global'
    symlink 'gitconfig'
    symlink 'tmux.config'
    symlink 'zshrc'
    symlink 'zlogin'
    symlink 'railsrc'
    symlink 'irbrc'

    FileUtils.mkdir_p home 'bin'
    FileUtils.symlink bin('tat'), home('bin/tat')
  end
end
