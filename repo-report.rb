require 'octokit'
require 'pry'

# Configure global settings
client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
client.auto_paginate = true

#org = client.org 'highlands'

result = []

repos = client.org_repos 'highlands' #.sort_by{|r| r.name}
#repos = org.rels[:repos].get.data#.sort_by{|r| r.name}
repo = repos.first

#repos.each do |repo|
  branches = repo.rels[:branches].get.data
  binding.pry
  commits = repo.rels[:commits].get.data
  merged_branches = branches.select{
    |b| commits.map(&:sha).include?(b.commit.sha)
  }
  result << {
    name: repo.name,
    created_at: repo.created_at,
    updated_at: repo.updated_at,
    merged_branches: merged_branches.map(&:name)
  }
#end

puts result.to_json
