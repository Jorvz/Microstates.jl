using Random, LinearAlgebra

export MS

function MS(Serie, Threshold; Window_Size = nothing, StatsBlock= 2, RP_percent= 0.05)
    
"""
    MS(Serie, Threshold, Window_Size::Int = nothing, StatsBlock::Int = 2, RP_percent::Float64 = 0.05) where T

Calculate the microstates and entropy of a given time series.

# Arguments
- `Serie`: The input time series data, where rows represent time steps and columns represent dimensions.
- `Threshold::Float`: The threshold value for calculating distances between points in the time series.
- `Window_Size::Int`: The size of the window for analysis. Defaults to the length of the time series if not provided.
- `StatsBlock::Int`: The size of the blocks used for calculating microstates. Defaults to 2.
- `RP_percent::Float`: The percentage of recurrence points used for sampling. Defaults to 0.05.

# Returns
- `MicroStates`: A vector of microstates representing the distribution of states in the time series.
- `S`: The entropy of the time series.

# Example
```julia
# One-dimensional time series
serie_1d = rand(100)
threshold = 0.5
microstates, entropy = MS(serie_1d, threshold)

# Multidimensional time series
serie_2d = rand(100, 3)
threshold = 0.5
microstates, entropy = MS(serie_2d, threshold)

Notes
If the input series is one-dimensional, it is reshaped to a two-dimensional array with one column.
The function uses Euclidean distance for calculating the distances between points in the series.
"""


    if ndims(Serie) == 1
        Serie = reshape(Serie, :, 1)
    end
    
    if Window_Size === nothing
        Window_Size = size(Serie, 1)
    end

    Max_Micro = 2 ^ (StatsBlock * StatsBlock)
    Sample_N = Int(floor(RP_percent * Window_Size * Window_Size))
    
    MicroStates = zeros(Max_Micro)
    Stats = zeros(Max_Micro)
    
    x_rand = rand(1:(Window_Size - StatsBlock), Sample_N)
    y_rand = rand(1:(Window_Size - StatsBlock), Sample_N)
    
    pow_vec = 2 .^ (0:(StatsBlock * StatsBlock - 1))
    
    for count in 1:Sample_N
        Add = 0
        for count_x in 1:StatsBlock
            for count_y in 1:StatsBlock
                dist = norm(Serie[x_rand[count] + count_x, :] - Serie[y_rand[count] + count_y, :])
                if dist <= Threshold
                    a_binary = 1
                else
                    a_binary = 0
                end
                Add += a_binary * pow_vec[count_y + (count_x - 1) * StatsBlock]
            end
        end
        Stats[Add + 1] += 1
    end
    
    S = 0.0
    
    MicroStates .= Stats ./ Sample_N
    
    for k in 1:Max_Micro
        if Stats[k] > 0
            S += -MicroStates[k] * log(MicroStates[k])
        end
    end
    
    return MicroStates, S
end
