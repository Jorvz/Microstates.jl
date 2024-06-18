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
