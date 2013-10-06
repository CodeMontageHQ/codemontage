require 'spec_helper'

describe Organization do
  it { should have_many(:organization_metrics) }
  it { should have_many(:projects) }

  it { should respond_to(:name) }
  it { should respond_to(:url) }
  it { should respond_to(:github_org) }
  it { should respond_to(:description) }
  it { should respond_to(:is_tax_exempt) }
  it { should respond_to(:contact_role) }
  it { should respond_to(:contact_email) }
  it { should respond_to(:annual_budget_usd) }
  it { should respond_to(:total_staff_size) }
  it { should respond_to(:tech_staff_size) }
  it { should respond_to(:notes) }
  it { should respond_to(:image_url) }
  it { should respond_to(:twitter) }
  it { should respond_to(:logo) }
end
