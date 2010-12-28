require 'helper'

describe Scam do
  uses_constants('FeedTemplate')

  context "including Scam" do
    it "adds id attr accessor" do
      template = FeedTemplate.new
      template.id = 5
      template.id.should == 5
    end
  end

  context "class enumerable" do
    it "works" do
      t1 = FeedTemplate.create(:id => 1)
      t2 = FeedTemplate.create(:id => 2)
      FeedTemplate.inject([]) { |acc, t| acc << t; acc }.should == [t1, t2]
      FeedTemplate.detect { |t| t.id == 1 }.should == t1
    end
  end

  describe ".initialize" do
    before do
      @template = FeedTemplate.new(:id => 5)
    end

    it "sets attributes" do
      @template.id.should == 5
    end
  end

  describe ".find" do
    before do
      @template = FeedTemplate.create(:id => 1)
    end

    context "with integer id" do
      it "returns instance if found" do
        FeedTemplate.find(1).should == @template
      end
    end

    context "with string id" do
      it "returns instance if found" do
        FeedTemplate.find('1').should == @template
      end
    end

    it "returns nil if not found" do
      FeedTemplate.find(20000000000).should be_nil
    end
  end

  describe ".create" do
    before do
      @template = FeedTemplate.create(:id => 1)
    end

    it "returns instance" do
      @template.should be_instance_of(FeedTemplate)
    end

    it "adds model to list" do
      FeedTemplate.should include(@template)
    end
  end
end