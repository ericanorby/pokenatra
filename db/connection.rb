ActiveRecord::Base.establish_connection({
  database: 'pokemon_db',
  adapter: 'postgresql'
})

if defined? Sinatra
	after do
	  ActiveRecord::Base.connection.close
	end
end
