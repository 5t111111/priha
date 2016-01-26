# Priha

If you are a guy who always find something wrong only after sending a pull requset, Priha will help you because Priha lets you examine files' diff between the parent branch and HEAD of the current branch in a real GitHub pull request.

## Installation

```ruby
gem install priha
```

## Usage

**CAUTION:** **DO NOT** use Priha for your secret repostitory. Since Priha pushes some commits to another repository on GitHub, it easily cause a security incident, espacially the branch you set for Priha is "public". Also, Priha removes all branches on the repository specified in config, so you **MUST** create a new repository for this purpose and **DO NOT** use the existing one.

### Create config file

Priha requires a YAML config file (`$HOME/.priha_config.yml` or `$USERPROFILE\.priha_config.yml` for Windows) where your GitHub information is set like the followings.

```yaml
username: <your github username>
repo: <your github repository to push for a temporary pull request>
parent_branch: <default parent branch to merge> (optional)
access_token: <your github access token> (optional)
```

Note that you can specify parent_branch by passing that name as an argument, and access_token will be overwritten by "GITHUB_ACCESS_TOKEN" environment variable when exists.

### Let's see files' diff on a GitHub pull request

Simply run `priha` when you are in the topic branch which you want to diff with the parent branch.

``` text
$ priha
```

Or you can specify the parent branch by passing it as an argument.

``` text
$ priha develop
```

Then you can see files' diff in your web browser (OS X only), or copy/paste displayed URL.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/5t111111/priha.
