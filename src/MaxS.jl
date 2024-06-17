using Random, LinearAlgebra

include("MS.jl")

export MaxS

"""
    MaxS(serie, eps_param = (min, max, n); Window_Size=nothing, StatsBlock=2, RP_percent=0.05)

Calculate the maximum entropy and optimal threshold of a given time series.

# Arguments
- `Serie`: The input time series data, where rows represent time steps and columns represent dimensions.
- `eps_param` : List in the form: (min, max, n). Where min [min,max] is the interval for the threshold and `n` is the number of values in this interval.
- `Window_Size::Int`: The size of the window for analysis. Defaults to the length of the time series if not provided.
- `StatsBlock::Int`: The size of the blocks used for calculating microstates. Defaults to 2.
- `RP_percent::Float`: The percentage of recurrence points used for sampling. Defaults to 0.05.

# Returns
- `S_max_val`: The maximum entropy value for a given threshhold range.
- `best_eps`: The threshold that maximizes the entropy.

# Example
```julia
# One-dimensional time series
serie_1d = rand(100)
threshold_range = (0.1, 0.5, 10)
microstates, entropy = MaxS(serie_1d, threshold_range)

# Multidimensional time series
serie_3d = rand(100, 3)
threshold_range = (0.01, 0.70, 20)
microstates, entropy = MS(serie_3d, threshold_range)

Notes
For more info see MS() documentation
"""
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


