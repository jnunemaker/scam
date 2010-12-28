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

  describe ".sorted_by" do
    it "defaults to id" do
      FeedTemplate.sorted_by.should == :id
    end

    it "gets/sets sorted_by" do
      FeedTemplate.sorted_by(:position)
      FeedTemplate.sorted_by.should == :position
    end
  end

  describe ".all" do
    context "default sort by" do
      before do
        FeedTemplate.create(:id => 2)
        FeedTemplate.create(:id => 1)
      end

      it "returns all instances sorted by id" do
        FeedTemplate.all.map(&:id).should == [1, 2]
      end
    end

    context "custom sort by" do
      before do
        FeedTemplate.sorted_by(:position)
        FeedTemplate.send(:attr_accessor, :position)
        FeedTemplate.create(:id => 2, :position => 1)
        FeedTemplate.create(:id => 1, :position => 2)
      end

      it "returns all instances sorted by custom attribute" do
        FeedTemplate.all.map(&:id).should == [2, 1]
      end
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

  describe ".[]" do
    before do
      @template = FeedTemplate.create(:id => 1)
    end

    context "with integer id" do
      it "returns instance if found" do
        FeedTemplate[1].should == @template
      end
    end

    context "with string id" do
      it "returns instance if found" do
        FeedTemplate['1'].should == @template
      end
    end

    it "returns nil if not found" do
      FeedTemplate[1111122].should be_nil
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

  describe "#eql?" do
    it "returns true if same class and id" do
      FeedTemplate.new(:id => 1).should eql(FeedTemplate.new(:id => 1))
    end

    it "returns false if different class" do
      FeedTemplate.new(:id => 1).should_not eql(Class.new.new)
    end

    it "returns false if different id" do
      FeedTemplate.new(:id => 1).should_not eql(FeedTemplate.new(:id => 2))
    end
  end

  describe "#==" do
    it "returns true if same class and id" do
      FeedTemplate.new(:id => 1).should == FeedTemplate.new(:id => 1)
    end

    it "returns false if different class" do
      FeedTemplate.new(:id => 1).should_not == Class.new.new
    end

    it "returns false if different id" do
      FeedTemplate.new(:id => 1).should_not == FeedTemplate.new(:id => 2)
    end
  end
end