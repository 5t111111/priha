require 'test_helper'

include Priha

class PrihaTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Priha::VERSION
  end

  def test_if_current_branch_returns_branch_name_when_succeeds
    GitCommand.stub :call_git_name_rev_name_only_head, [0, "something-cool\n"] do
      assert { current_branch == 'something-cool' }
    end
  end

  def test_if_current_branch_returns_nil_when_fails
    GitCommand.stub :call_git_name_rev_name_only_head, [1, 'xxx'] do
      assert { current_branch == nil }
    end
  end

  def test_if_current_branch_uses_intance_variable_as_cache
    GitCommand.stub :call_git_name_rev_name_only_head, [0, "something-cool\n"] do
      assert { current_branch == 'something-cool' }
    end
    GitCommand.stub :call_git_name_rev_name_only_head, [1, nil] do
      assert { current_branch == 'something-cool' }
    end
  end

  def test_if_add_remote_returns_true_when_command_succeeds
    GitCommand.stub :call_git_remote_add, [0, ''] do
      assert { add_remote('testtoken', 'testuser', 'testrepo') == true }
    end
  end

  def test_if_add_remote_returns_true_when_command_fails
    GitCommand.stub :call_git_remote_add, [1, 'error'] do
      assert { add_remote('testtoken', 'testuser', 'testrepo') == false }
    end
  end

  def test_if_remove_remote_returns_true_when_command_succeeds
    GitCommand.stub :call_git_remote_remove, [0, ''] do
      assert { remove_remote == true }
    end
  end

  def test_if_remove_remote_returns_true_when_command_fails
    GitCommand.stub :call_git_remote_remove, [1, 'error'] do
      assert { remove_remote == false }
    end
  end

  def test_if_push_returns_true_when_command_succeeds
    GitCommand.stub :call_git_push, [0, ''] do
      assert { push('local', 'remote') == true }
    end
  end

  def test_if_push_returns_true_when_command_fails
    GitCommand.stub :call_git_push, [1, 'error'] do
      assert { push('local', 'remote') == false }
    end
  end
end
