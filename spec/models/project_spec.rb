require 'spec_helper'

describe Project do
  it { should belong_to(:organization) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:github_repo) }
end
