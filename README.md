# Microstates

[![Build Status](https://github.com/Jorvz/Microstates.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/Jorvz/Microstates.jl/actions/workflows/CI.yml?query=branch%3Amain)
=======
## Description

Microstates.jl is a package designed to calculate the probabilities associated with microstates from a Recurrence Plot. Based on these probabilities, it can also estimate the entropy of the microstates for a given time series. These methods are useful in the context of dynamical systems, dealing with chaotic, stochastic, or periodic time series.

## Installation

To install the package, you can clone the repository and use Pkg to add the package locally:

```julia
using Pkg
Pkg.add(url="https://github.com/Jorvz/Microstates.jl")
```

or you can directly type:

```julia
using Pkg
Pkg.add(Microstates)
```

## Exemple of Usage

Calculating the microstate probabilities and the microstate entropy of a given time series is straightforward:

```julia
# One-dimensional time series
serie_1d = rand(100)
threshold = 0.5
microstates, entropy = MS(serie_1d, threshold)

# Multidimensional time series varying microstate size
serie_3d = rand(100, 3)
threshold = 0.5
microstates, entropy = MS(serie_3d, threshold, Stats_Block=3)
```

One can also easily calculate the maximum microstate entropy as well as the threshold that maximizes it by using:

```julia
# One-dimensional time series
serie_1d = rand(100)
threshold_range = (0.1, 0.5, 10)
S_max, best_eps = MaxS(serie_1d, threshold_range)

# Multidimensional time series
serie_3d = rand(100, 3)
threshold_range = (0.01, 0.70, 20)
S_max, best_eps = MaxS(serie_3d, threshold_range)
```


## References

- DE LIMA PRADO, Thiago; MACHADO, Vandertone Santos; CORSO, Gilberto; DOS SANTOS LIMA, Gustavo Zampier; LOPES, Sergio Roberto. "How to compute suitable vicinity parameter and sampling time of recurrence analysis." Nonlinear Dynamics (Dordrecht. Online), v. 112, p. 1141-1152, 2023.

- PRADO, Thiago Lima; BOARETTO, Bruno Rafael Reichert; CORSO, Gilberto; DOS SANTOS LIMA, Gustavo Zampier; KURTHS, Jürgen; LOPES, Sergio Roberto. "A direct method to detect deterministic and stochastic properties of data." New Journal of Physics, v. 24, p. 033027, 2022.

- PRADO, T. L.; MACAU, E. E. N.; LOPES, S. R. "Detection of data corruption in stationary time series using recurrence microstates probabilities." The European Physical Journal. Special Topics (Online), v. 230, p. 1, 2021.

- PRADO, T. L.; CORSO, G.; DOS SANTOS LIMA, G. Z.; BUDZINSKI, R. C.; BOARETTO, B. R. R.; FERRARI, F. A. S.; MACAU, E. E. N.; LOPES, S. R. "Maximum entropy principle in recurrence plot analysis on stochastic and chaotic systems." Chaos, v. 30, p. 043123, 2020.

- CORSO, Gilberto; PRADO, T. L.; LIMA, G. Z. S.; KURTHS, J.; LOPES, S. R. "Quantifying entropy using recurrence matrix microstates." Chaos, v. 28, p. 083108, 2018.
