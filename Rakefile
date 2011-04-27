desc 'Add shortcut via KEY and DESTINATION'
task :add do
  require 'sequel'
  DB = Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://b.db')

  key ||= ENV['KEY'].to_s
  4.times { key << (65 + rand(25)).chr.downcase } if key.empty?

  if DB[:links].where(:destination => ENV['DESTINATION']).first
    if ENV['FORCE']
      DB[:links].where(:destination => ENV['DESTINATION']).update(:key => key)
    else
      key = DB[:links].where(:destination => ENV['DESTINATION']).first[:key]
    end
  else
    DB[:links].insert(:key => key, :destination => ENV['DESTINATION'])
  end
  
  puts "http://#{ENV['B_ROOT']}#{key} -> #{ENV['DESTINATION']}"
end

desc 'Setup links table'
task :setup do
  require 'sequel'
  DB = Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://b.db')
  
  DB.create_table :links do
    String :key
    String :destination
  end
end
