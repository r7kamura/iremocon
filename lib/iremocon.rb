require "iremocon/version"
require "net/telnet"

class Iremocon
  attr_reader :host, :port, :telnet

  def initialize(host, port = 51013)
    @host = host
    @port = port
    connect
  end

  def au
    command("au")
  end

  def is(channel)
    command("is", channel)
  end

  def ic(channel)
    command("ic", channel)
  end

  def cc
    command("cc")
  end

  def tm(channel, time, interval = 0)
    command("tm", channel, time.to_i, interval)
  end

  def tl
    command("tl")
  end

  def td(timer_id)
    command("td", timer_id)
  end

  def ts(time)
    command("ts", time.to_i)
  end

  def tg
    command("tg")
  end

  def vr
    command("vr")
  end

  def li
    command("li")
  end

  def hu
    command("hu")
  end

  def te
    command("te")
  end

  def se
    command("se")
  end

  private

  def connect
    @telnet = Net::Telnet.new("Host" => @host, "Port" => @port)
  rescue Errno::ECONNREFUSED
    raise ConnectionError.new("Connection failed - #{@host}:#{@port}")
  end

  def command(name, *args)
    str = ["*#{name}", *args].compact.join(";")
    
    res = ""
    catch(:exit) {
        @telnet.cmd(str) { |r| throw :exit, res = r }
    }
  rescue Timeout::Error
    puts "Timeout - 10sec"

    return (res)
  end

  class ConnectionError < StandardError; end
end
