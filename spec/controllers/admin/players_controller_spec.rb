require 'spec_helper'

describe Admin::PlayersController do
  describe "#index" do
    before { get :index }
    it { response.should be_success }
    it { assigns(:players).should == Player.all }
  end

  describe "#new" do
    before { get :new }
    it { response.should be_success }
    it { assigns(:player).should_not be_nil }
  end

  describe "#create" do
    it "should create a new player" do
      expect { get :create, player: {name: "foo"} }.to change(Player, :count).by(1)
      response.should redirect_to admin_players_path
    end
  end

  describe "#destroy" do
    it "should delete a player" do
      player = Player.create name: "foo"
      expect { get :destroy, id: player.id }.to change(Player, :count).by(-1)
      response.should redirect_to admin_players_path
    end
  end

  describe "#edit" do
    it "should delete a player" do
      player = Player.create name: "foo"
      get :edit, id: player.id
      assigns[:player].should == player
    end
  end

  describe "#update" do
    it "should update a player" do
      player = Player.create name: "foo"
      get :update, id: player.id, player: {name: 'booyah!'}
      player.reload.name.should == "booyah!"
    end
  end
end