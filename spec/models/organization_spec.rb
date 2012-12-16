require 'spec_helper'

describe Organization do
  it { should have_many(:projects) }
end
