using Random, LinearAlgebra

include("MS.jl")

export MaxS

function MaxS(serie, eps_param = (min, max, n); Window_Size=nothing, StatsBlock=2, RP_percent=0.05)

    eps_range = LinRange(eps_param[1],eps_param[2], eps_param[3])
	
    if ndims(serie) == 1
       serie = reshape(serie, :, 1)
    end
    
    if Window_Size === nothing
        Window_Size = size(serie, 1)
    end

    S_vec = Float64[]
    for eps in eps_range
        push!(S_vec, MS(serie, eps, Window_Size=Window_Size, StatsBlock=StatsBlock, RP_percent=RP_percent)[2])
    end

    S_max_val = maximum(S_vec)
    best_eps = eps_range[argmax(S_vec)]
    
    return S_max_val, best_eps
end


