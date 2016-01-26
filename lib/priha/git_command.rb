module Priha
  module GitCommand
    def call_git_name_rev_name_only_head
      result = `git name-rev --name-only HEAD`
      return $?.exitstatus, result
    rescue => e # catch exception intead of status (a workaround for Windows)
      STDERR.puts e
      return 127, ''
    end

    def call_git_remote_add(token, username, repository_name, remote_name)
      result = `git remote add #{remote_name} "https://#{token}@github.com/#{username}/#{repository_name}"`
      return $?.exitstatus, result
    rescue => e # catch exception intead of status (a workaround for Windows)
      STDERR.puts e
      return 127, ''
    end

    def call_git_remote_remove(remote_name)
      result = `git remote remove #{remote_name}`
      return $?.exitstatus, result
    rescue => e # catch exception intead of status (a workaround for Windows)
      STDERR.puts e
      return 127, ''
    end

    def call_git_push(remote_name, local_branch, remote_branch)
      result = `git push #{remote_name} #{local_branch}:#{remote_branch} --quiet`
      return $?.exitstatus, result
    rescue => e # catch exception intead of status (a workaround for Windows)
      STDERR.puts e
      return 127, ''
    end

    module_function :call_git_name_rev_name_only_head, :call_git_remote_add,
                    :call_git_remote_remove, :call_git_push
  end
end
