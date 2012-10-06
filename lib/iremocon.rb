require "iremocon/version"
require "net/telnet"

class Iremocon
  attr_reader :host, :port, :telnet

  def initialize(host, port)
    @host = host
    @port = port
    connect
  end

  private

  def connect
    @telnet = Net::Telnet.new("Host" => @host, "Port" => @port)
  rescue Errno::ECONNREFUSED
    raise ConnectionError.new("Connection failed - #{@host}:#{@port}")
  end

  class ConnectionError < StandardError; end
end
