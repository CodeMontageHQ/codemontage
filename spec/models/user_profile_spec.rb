require "spec_helper"

describe UserProfile do
  it { should belong_to(:user) }
  it { should ensure_length_of(:headline).is_at_most(128) }
end
