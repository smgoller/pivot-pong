require 'spec_helper'

describe AchievementsController do
  describe "#index" do
    before { get :index }
    it { response.should be_success }
    it { assigns(:achievements).should == Achievement.subclasses }
  end

  describe "#show" do
    it "loads the achievement" do
      achievement = Beginner.create(player: Player.create(name: 'me'))
      get :show, id: 'beginner'
      response.should be_success
      assigns(:achievement).should == Beginner
      assigns(:achievements).should == [achievement]
    end
  end
end
