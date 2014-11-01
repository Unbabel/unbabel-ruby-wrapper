require 'spec_helper'

describe Unbabel::Client do
  subject { described_class }

  describe '#new' do
    context 'when there is username' do
      it 'should raise an ArgumentError' do
        expect {
          subject.new
        }.to raise_error(ArgumentError, /username/)
      end
    end

    context 'when there is no token' do
      it 'should raise an ArgumentError' do
        expect {
          subject.new(username: 'd')
        }.to raise_error(ArgumentError, /token/)
      end
    end

    context 'when there is username and token' do
      it 'should not raise any ArgumentError' do
        expect {
          subject.new(username: 'd', token: '123')
        }.to_not raise_error
      end
    end
  end
end
