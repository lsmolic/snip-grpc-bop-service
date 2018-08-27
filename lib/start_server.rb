#!/usr/bin/env ruby

require 'rubygems'
require 'bop_services_pb'
require_relative 'services/bop_service'

class BopServer

	class << self
		def start
			start_grpc_server
		end

		private

		def start_grpc_server
			@server = GRPC::RpcServer.new
			@server.add_http2_port("0.0.0.0:50053", :this_port_is_insecure)
			@server.handle(BopService)
			@server.run_till_terminated
		end
	end
end

BopServer.start
