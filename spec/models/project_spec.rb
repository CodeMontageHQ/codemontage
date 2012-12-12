require 'spec_helper'

describe Project do
  it { should belong_to(:organization) }
end
