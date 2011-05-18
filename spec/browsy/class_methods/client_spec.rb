require 'spec_helper'

describe Browsy, '.client' do

  subject { described_class.client }

  it_behaves_like 'an idempotent method'

end

