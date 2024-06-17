using Random, LinearAlgebra

export MS2

function MS2(Serie, Threshold, Window_Size=nothing, StatsBlock=2, RP_percent=0.05)
    if Window_Size === nothing
        Window_Size = length(Serie)
    end
    
    Max_Micro = 2 ^ (StatsBlock * StatsBlock)
    Sample_N = Int(floor(RP_percent * Window_Size * Window_Size))
    
    MicroStates = zeros(Max_Micro)
    Stats = zeros(Max_Micro)
    
    x_rand = rand(1:(Window_Size - StatsBlock), Sample_N)
    y_rand = rand(1:(Window_Size - StatsBlock), Sample_N)
    
    pow_vec = 2 .^ (0:(StatsBlock * StatsBlock - 1)) |> reshape(StatsBlock, StatsBlock)
    
    for count in 1:Sample_N
        Add = 0
        x_base = x_rand[count]
        y_base = y_rand[count]
        
        x_block = Serie[x_base:x_base + StatsBlock - 1]
        y_block = Serie[y_base:y_base + StatsBlock - 1]
        
        binary_matrix = (abs.(x_block .- y_block') .<= Threshold) |> Int
        
        Add = sum(binary_matrix .* pow_vec)
        Stats[Add + 1] += 1
    end
    
    MicroStates .= Stats ./ Sample_N
    
    nonzero_probs = MicroStates[MicroStates .> 0]
    S = -sum(nonzero_probs .* log.(nonzero_probs))
    
    return MicroStates, S
end