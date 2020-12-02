require 'station'

describe Station do
  let(:station) { described_class.new("Euston", 1) }
  it 'allows instance station to be created' do
    expect(station).to be_instance_of(Station)
  end

  it 'can read its own name' do
    expect(station.name).to eq 'Euston'
  end

  it 'it can read its own zone' do
    expect(station.zone).to eq 1
  end
end
