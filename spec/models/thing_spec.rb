require 'rails_helper'

RSpec.describe Thing, type: :model do

  it { should have_valid(:name).when('Backpack', 'Down Jacket') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:days).when('3', '8') }
  it { should_not have_valid(:days).when('three') }

  it { should have_valid(:zip_code).when('02116', '03853') }
  it { should_not have_valid(:zip_code).when(nil, '', 0, 1.13) }

  it { should have_valid(:body).when('Great', 'Love it') }
  it { should_not have_valid(:body).when(nil, '') }

end
