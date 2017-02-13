require 'rails_helper'

RSpec.describe Review, type: :model do

  it { should have_valid(:body).when('Great', 'Love it') }
  it { should_not have_valid(:body).when(nil, '') }

end
