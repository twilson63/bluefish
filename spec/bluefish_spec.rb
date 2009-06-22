require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Bluefish" do
  before do
    Bluefish::Base.database("test.sqlite3")    
    class Person < Bluefish::Base
    end
    Person.delete_all
    
  end
  
  it "should Create Database" do
    Bluefish::Base.database("test.sqlite3").should be_true        
  end

  it "should create a bluefish model class" do    
    Person.should be_true
  end
  
  it "should remoe all bluefish records for a given model" do

    p = Person.new(0, :first_name => "Johnny", :last_name => "People")
    
    p.save

    Person.count.should == 1
    
    Person.delete_all
    
    Person.count.should == 0
    
  end
  
  
  it "should create a bluefish record" do
    Person.delete_all    
    Person.count.should == 0
    p = Person.new(0, :first_name => "Johnny", :last_name => "People")
    p.save
  
    Person.count.should == 1
    Person.delete_all
    Person.count.should == 0
  end

  it "should update a bluefish record" do
    Person.delete_all
    Person.count.should == 0
    p = Person.new(0, :first_name => "Johnny", :last_name => "People")
    p.save
    
    Person.count.should == 1
    p.body[:first_name].should == "Johnny"
    p.body[:first_name] = "Jimmy"
    p.save
    
    p = Person.find(p.id)
    p.body[:first_name].should == "Jimmy"
    Person.delete_all
  end
  

  it "should destroy bluefish model" do
    p = Person.new(0, :first_name => "Johnny", :last_name => "People")
    p.save    
    Person.count.should == 1
    p.destroy
    Person.count.should == 0
    
  end
  
  it "should find all bluefish models" do
    p = Person.new(0, :first_name => "Johnny", :last_name => "People")
    p.save    

    p = Person.new(0, :first_name => "Jimmy", :last_name => "People")
    p.save    
    
    Person.count.should == 2
    
    Person.find_all.each do |row|
      row.body[:last_name].should == "People"
      (row.body[:first_name] == "Johnny" or row.body[:first_name] == "Jimmy").should be_true
    end 
    
    Person.delete_all
    
  end
  
  
end


