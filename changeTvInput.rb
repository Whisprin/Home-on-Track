require 'open-uri'

class GrundigMakro
	Api_format = "http://%{host}:%{port}/sendrcpackage?keyid=%{keyid}&keysymbol=%{keysymbol}"

	Mapping = {
		:source => [-2541, -3992],
		:left => [-2495, -4096],
		:right => [-2494, -4095],
		:ok => [-2490, 13]
	}

	def initialize(host, port=8085)
		@host = host
		@port = port
		@calls = []
	end

	def add_call(target)
		@calls.push(target)
	end

	def print
		puts Mapping[:test]
	end

	def execute
		@calls.each do |call|
			keyid = Mapping[call][0]
			keysymbol = Mapping[call][1]
			open(Api_format % { host: @host, port: @port, keyid: keyid, keysymbol: keysymbol}).read
		end
	end
end

def tv_from_pc_to_onkyo(host)
	tv_call(host, [:source, :left, :ok])
end

def tv_from_onkyo_to_pc(host)
	tv_call(host, [:source, :right, :ok])
end

def tv_call(host, calls)
	grundig = GrundigMakro.new(host)
	calls.each do |call|
		grundig.add_call(call)
	end
	grundig.execute	
end
