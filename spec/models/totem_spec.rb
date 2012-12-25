require 'spec_helper'

describe Totem do
  let(:me) { Player.create(name: 'me') }
  let(:you) { Player.create(name: 'you') }

  it "should be valid" do
    me.totems.create(loser: you).should be_valid
  end
end