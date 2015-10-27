require "spec_helper"

describe FavoriteProject do
  it { should belong_to(:project) }
  it { should belong_to(:user) }
end
