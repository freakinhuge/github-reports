# GitHub Repo Report

### Environment Variables

Add your github oauth token as an environment variable:

    export GITHUB_TOKEN='your-github-token'

If you don't already have a token you can get one
[here](https://github.com/settings/tokens)

### Installing gems

You will need the following gems. To install them do:

    gem install octokit
    gem install pry

### Running the script

To run the ruby script just do:

    ruby repo-report.rb

If you want to output to a file do:

    ruby repo-report.rb > your-file.txt
