require	'rubygems'
require	'faraday'
require	'json'

class Simi
	def initialize(text, bahasa)
		@send = text
		@opsi = bahasa
	end
	
	def get
		begin
			conn = Faraday.new("https://api.simsimi.net/v2/?text=#{@send}&lc=#{@opsi}&key=API-1234-abcd-1234-abcd&cf=false", ssl: {verify: false})
			respon = conn.get

			b = JSON.parse(respon.body)
			return b['success']
		rescue => e
			puts("Connection error")
		end
	end
end

a = "#{ARGV[0]}"
b = "#{ARGV[1]}"

chat = Simi.new(a, b)

puts chat.get
