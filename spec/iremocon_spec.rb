require "spec_helper"

describe Iremocon do
  let!(:server) do
    TCPServer.new("127.0.0.1", 50000)
  end

  let(:client) do
    Iremocon.new("127.0.0.1", 50000)
  end

  after do
    server.close
  end

  describe "#new" do
    context "when connection succeeded" do
      it "should connect to tcp server by Net::Telnet client" do
        client.telnet.should be_a(Net::Telnet)
        client.telnet.close
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

  describe "#au" do
    it "should send *au" do
      client.telnet.should_receive(:cmd).with("*au")
      client.au
    end
  end

  describe "#is" do
    it "should send *is;<channel>" do
      client.telnet.should_receive(:cmd).with("*is;1")
      client.is(1)
    end
  end

  describe "#ic" do
    it "should send *ic;<channel>" do
      client.telnet.should_receive(:cmd).with("*ic;1")
      client.ic(1)
    end
  end

  describe "#cc" do
    it "should send *cc" do
      client.telnet.should_receive(:cmd).with("*cc")
      client.cc
    end
  end

  describe "#tm" do
    it "should send *tm;<channel>;<time>;<interval>" do
      client.telnet.should_receive(:cmd).with("*tm;1;946652400;60")
      client.tm(1, 946652400, 60)
    end

    it "should convert time to epoch time" do
      client.telnet.should_receive(:cmd).with("*tm;1;946652400;60")
      client.tm(1, Time.local(2000), 60)
    end

    it "should complement interval with 0 as default" do
      client.telnet.should_receive(:cmd).with("*tm;1;946652400;0")
      client.tm(1, Time.local(2000))
    end
  end

  describe "#tl" do
    it "should send *tl" do
      client.telnet.should_receive(:cmd).with("*tl")
      client.tl
    end
  end

  describe "#td" do
    it "should send *td;<timer_id>" do
      client.telnet.should_receive(:cmd).with("*td;1")
      client.td(1)
    end
  end

  describe "#ts" do
    it "should send *ts;<time>" do
      client.telnet.should_receive(:cmd).with("*ts;946652400")
      client.ts(946652400)
    end

    it "should convert time to epoch time" do
      client.telnet.should_receive(:cmd).with("*ts;946652400")
      client.ts(Time.local(2000))
    end
  end

  describe "#tg" do
    it "should send *tg" do
      client.telnet.should_receive(:cmd).with("*tg")
      client.tg
    end
  end

  describe "#vr" do
    it "should send *vr" do
      client.telnet.should_receive(:cmd).with("*vr")
      client.vr
    end
  end
end
