module Microstates

using Random
using LinearAlgebra

# Write your package code here.
export MS, MaxS

include("MS.jl")
include("MaxS.jl")
#include("MS2.jl")

end
