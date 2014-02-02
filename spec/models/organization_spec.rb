require 'spec_helper'

describe Organization do
  it { should have_many(:organization_metrics) }
  it { should have_many(:projects) }
  it { should validate_presence_of(:name) }

  context 'if public submission' do
    before { subject.stub(:is_public_submission){true} }
    it { should validate_presence_of(:github_org) }
  end

  context 'if not public submission' do
    before { subject.stub(:is_public_submission){false} }
    it { should_not validate_presence_of(:github_org) }
  end

  context 'if not public submission, implicit' do
    it { should_not validate_presence_of(:github_org) }
  end
end
