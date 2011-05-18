require 'spec_helper'

describe Browsy, '.config' do

  subject { described_class.config }

  it_behaves_like 'an idempotent method'

  it { should be_an_instance_of Configuration }

end

