using Microstates
using Test
using Random

@testset "Microstates.jl" begin
    # Write your tests here.
	serie = rand(1000)
	eps =(0.01, 0.5, 20)
	print(Microstates.MaxS(serie,eps, StatsBlock=3))
end
