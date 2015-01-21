#!/bin/bash
set -v
if [ "${TRAVIS_PULL_REQUEST}" = "false" ]; then
  bundle exec rspec spec
else
  bundle exec rspec spec --tag ~@github_api
fi
