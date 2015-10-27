require "spec_helper"

describe Sponsorship do
  it { should belong_to(:organization) }
  it { should belong_to(:event) }
end
