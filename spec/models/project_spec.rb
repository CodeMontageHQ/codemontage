require 'spec_helper'

describe Project do

  it { should belong_to(:organization) }
  it { should respond_to(:name) }
  it { should respond_to(:github_repo) }
  it { should respond_to(:description) }
  it { should respond_to(:notes) }
  it { should respond_to(:cause_list) }
  it { should respond_to(:technology_list) }
  it { should respond_to(:is_active) }
end