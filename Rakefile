require_relative 'changeTvInput.rb'

host = "grundig"

task :default => [:tv_ok]

desc "Swtich TV from Onkyo to PC input"
task :tv_to_pc do
	tv_from_onkyo_to_pc(host)
end

desc "Swtich TV from PC to Onkyo input"
task :tv_to_onkyo do
	tv_from_pc_to_onkyo(host)
end

desc "Keep TV awake"
task :tv_ok do
	tv_call(host, [:ok])
end