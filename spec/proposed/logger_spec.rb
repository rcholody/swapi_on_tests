require_relative '../../lib/proposed/logger'

describe Logger do
  let(:message) { 'some message' }

  it 'logs info message' do
    expect(Logger.log(message)).to eq "LOG: #{message}"
  end

  it 'logs error message' do
    expect(Logger.error(message)).to eq "ERROR: #{message}"
  end
end
