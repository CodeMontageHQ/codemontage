require "spec_helper"

describe Service do
  it { should belong_to(:user) }
end
