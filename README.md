# GitHub Repo Report

### Environment Variables

Add your github oauth token as an environment variable:

    export GITHUB_TOKEN='your-github-token'

If you don't already have a token you can get one
[here](https://github.com/settings/tokens)

### Installing gems

You will need the octokit gem to talk to the API. To install this do:

    gem install octokit

### Running the script

To run the ruby script just do:

    ruby repo-report.rb

If you want to output to a file do:

    ruby repo-report.rb > your-file.txt
