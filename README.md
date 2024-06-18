# Microstates

[![Build Status](https://github.com/Jorvz/Microstates.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/Jorvz/Microstates.jl/actions/workflows/CI.yml?query=branch%3Amain)
=======
## Descrição

`Microstates.jl` é um pacote para calcular as probabilidades associadas aos microestados a partir do Recurrence Plot. A partir dessas probabilidades, ele também pode estimar a entropia dos microestados de uma determinada série temporal. Esses métodos são úteis no contexto de sistemas dinâmicos, trabalhando com séries temporais caóticas, estocásticas ou periódicas.

## Instalação

Para instalar o pacote, você pode clonar o repositório e usar o `Pkg` para adicionar o pacote localmente:

```julia
using Pkg
Pkg.add(url="https://github.com/Jorvz/Microstates.jl")
```

##Referências

- DE LIMA PRADO, Thiago; MACHADO, Vandertone Santos; CORSO, Gilberto; DOS SANTOS LIMA, Gustavo Zampier; LOPES, Sergio Roberto. "How to compute suitable vicinity parameter and sampling time of recurrence analysis." Nonlinear Dynamics (Dordrecht. Online), v. 112, p. 1141-1152, 2023.

- PRADO, Thiago Lima; BOARETTO, Bruno Rafael Reichert; CORSO, Gilberto; DOS SANTOS LIMA, Gustavo Zampier; KURTHS, Jürgen; LOPES, Sergio Roberto. "A direct method to detect deterministic and stochastic properties of data." New Journal of Physics, v. 24, p. 033027, 2022.

- PRADO, T. L.; MACAU, E. E. N.; LOPES, S. R. "Detection of data corruption in stationary time series using recurrence microstates probabilities." The European Physical Journal. Special Topics (Online), v. 230, p. 1, 2021.

- PRADO, T. L.; CORSO, G.; DOS SANTOS LIMA, G. Z.; BUDZINSKI, R. C.; BOARETTO, B. R. R.; FERRARI, F. A. S.; MACAU, E. E. N.; LOPES, S. R. "Maximum entropy principle in recurrence plot analysis on stochastic and chaotic systems." Chaos, v. 30, p. 043123, 2020.

- CORSO, Gilberto; PRADO, T. L.; LIMA, G. Z. S.; KURTHS, J.; LOPES, S. R. "Quantifying entropy using recurrence matrix microstates." Chaos, v. 28, p. 083108, 2018.
