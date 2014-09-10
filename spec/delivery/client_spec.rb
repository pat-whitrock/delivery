require 'spec_helper'

describe Delivery::Client do
  let(:client) { Delivery::Client.new }

  describe '#connection' do
    it 'looks like a Faraday connection' do
      expect(client.send(:connection)).to be_a Faraday::Connection
    end
  end

  describe '#post' do
    let(:path) { 'merchants' }
    let(:params) {{}}
    it 'calls #request with the proper HTTP verb' do
      expect(client).to receive(:request).with(:post, path, params)
      client.send(:post, path, params)
    end
  end

  describe '#put' do
    let(:path) { 'merchants/1/edit' }
    let(:params) {{}}
    it 'calls #request with the proper HTTP verb' do
      expect(client).to receive(:request).with(:put, path, params)
      client.send(:put, path, params)
    end
  end

  describe '#request' do
    let(:connection) { instance_double(Faraday::Connection) }
    let(:http_verb) { :post }
    let(:path) { 'merchants' }
    before { allow(client).to receive(:connection).and_return(connection) }

    it 'calls an HTTP verb on #connection with a path' do
      expect(connection).to receive(http_verb).with(path)
      client.send(:request, http_verb, path)
    end
  end
end