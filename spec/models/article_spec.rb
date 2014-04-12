require 'spec_helper'

describe Article do
  pending "add some examples to (or delete) #{__FILE__}"

  context '#valid' do
    describe '#title' do
      subject { FactoryGirl.create(:article).title }

      it { is_expected.not_to be_nil }
    end
  end
end
