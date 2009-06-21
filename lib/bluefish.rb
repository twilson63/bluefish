require 'sqlite3'
require 'yaml'
require 'activesupport'

module Bluefish
  class Base
    attr_reader :id, :body
    attr_writer :body
    
    
    def initialize( id = 0, body = {} )
      @id = id 
      @body = body 
    end
    
    def save
      if self.id == 0
        self.id = self.class.count_all + 1
        self.class.sql('insert into entries values (?, ?, ?, ?, ?)', self.class.name.pluralize, self.id, self.body.to_yaml, Time.now, Time.now)
      else
        self.class.sql('update entries set body = ?, updated_at = ? where type = ? and id = ?', self.body.to_yaml, Time.now, self.class.name.pluralize, self.id)
      end
    end
    
    def destroy
      self.class.sql('delete from entries where type = ? and id = ?', self.class.name.pluralize, self.id)
    end
    
  
    def self.find_all
      results = []
      self.sql('select id, body from entries where type = ?', name.pluralize).each do |row|
        results << self.new(row[0], YAML.load(row[1]))
      end
      results      
    end
  
    def self.find(id)
      row = self.sql('select id, body from entries where type = ? and id = ?', name.pluralize, id)[0]
      self.new(row[0], YAML.load(row[1]))
    rescue
      []
    end
    
    def self.count_all
      self.sql('select count(*) from entries where type = ?', name.pluralize)[0][0].to_i
    end
       
    def self.database(name)
      @@db = SQLite3::Database.new( name )
      @@db.execute('create table if not exists entries (type text, id integer, body text, created_at datetime, updated_at datetime)')
    end
    
    def self.sql(sql, *args)
      @@db.execute(sql, *args)
    end
  
  end
end
