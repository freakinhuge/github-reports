require 'octokit'
require 'pry'

# Configure global settings
client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
client.auto_paginate = true

#org = client.org 'highlands'

result = []

repos = client.org_repos('highlands').sort_by{|r| r.name}

repos.each do |repo|
  branches = repo.rels[:branches].get.data
  commits = client.commits(repo.full_name, 'master')
  merged_branches = branches.select{
    |b| commits.map(&:sha).include?(b.commit.sha)
  }
  unmerged_branches = branches.select{
    |b| !commits.map(&:sha).include?(b.commit.sha)
  }
  result << {
    name: repo.full_name,
    created_at: repo.created_at,
    updated_at: repo.updated_at,
    merged_branches: merged_branches.map{
      |b| { name: b.name,
            updated_at: client.commit(repo.full_name, b.commit.sha).commit.committer.date
          }
    },
    unmerged_branches: unmerged_branches.map{
      |b| { name: b.name,
            updated_at: client.commit(repo.full_name, b.commit.sha).commit.committer.date
          }
    }
  }
end

puts result.to_json
