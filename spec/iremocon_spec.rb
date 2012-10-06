require "spec_helper"

describe Iremocon do
  describe "#new" do
    it do
      expect do
        Iremocon.new
      end.to_not raise_error
    end
  end
end
