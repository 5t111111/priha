require 'securerandom'
require 'octokit'
require "priha/version"
require 'priha/git_command'

module Priha
  IDENTIFIER = SecureRandom.hex(8)

  def current_branch
    return @current_branch if @current_branch
    status, result = GitCommand.call_git_name_rev_name_only_head
    return nil unless status == 0
    @current_branch = result.chomp
  end

  def add_remote(token, username, repository_name)
    status, _result = GitCommand.call_git_remote_add(token, username, repository_name, IDENTIFIER)
    return false unless status == 0
    true
  end

  def remove_remote
    status, _result = GitCommand.call_git_remote_remove(IDENTIFIER)
    return false unless status == 0
    true
  end

  def push(local_branch, remote_branch)
    status, _result = GitCommand.call_git_push(IDENTIFIER, local_branch, remote_branch)
    return false unless status == 0
    true
  end
end
