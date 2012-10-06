require "spec_helper"

describe Iremocon do
  describe "#new" do
    context "when connection succeeded" do
      it "should connect to tcp server with given host and port" do
        server = TCPServer.new("127.0.0.1", 50000)
        client = Iremocon.new("127.0.0.1", 50000)
        client.telnet.should be_a(Net::Telnet)
        client.telnet.close
        server.close
      end
    end

    context "when connection failed" do
      it do
        expect do
          Iremocon.new("127.0.0.1", 60000)
        end.to raise_error(Iremocon::ConnectionError)
      end
    end
  end
end
