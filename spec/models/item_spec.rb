require 'rails_helper'

RSpec.describe Item, type: :model do

  it { should have_valid(:name).when('Backpack', 'Down Jacket') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:size).when('S', '8') }
  it { should_not have_valid(:size).when(nil, '') }

  it { should have_valid(:image).when('http://images.gearjunkie.com/uploads/2015/06/VazeePace.jpg', 'http://media03.toms.com/static/www/new/images/giving/gv-prod-sport-shoe.png') }

  it { should have_valid(:zip_code).when('02116', '03853') }
  it { should_not have_valid(:zip_code).when(nil, '', 0, 1.13) }

  it { should have_valid(:body).when('Great', 'Love it') }
  it { should_not have_valid(:body).when(nil, '') }

end
