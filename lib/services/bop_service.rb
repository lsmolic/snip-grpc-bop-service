require 'grpc'
require 'bop_services_pb'

class BopService < Bop::BopService::Service
	def bop_it(bop_req, _unused_call)
		puts "Received URL bop request for #{bop_req.url}"
		Bop::BopResponse.new(url: "#{bop_req.url}?bopped=1")
	end
end

