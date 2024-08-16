# NamingConventions.jl

[![Documentation](https://img.shields.io/badge/docs-stable-blue.svg)](https://raphasampaio.github.io/NamingConventions.jl/stable)
[![CI](https://github.com/raphasampaio/NamingConventions.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/raphasampaio/NamingConventions.jl/actions/workflows/CI.yml)
[![codecov](https://codecov.io/gh/raphasampaio/NamingConventions.jl/graph/badge.svg?token=7tA9ajgsLf)](https://codecov.io/gh/raphasampaio/NamingConventions.jl)
[![Aqua](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)

## Introduction

This package provides a set of functions to convert between different naming conventions. The following naming conventions are supported:

- camelCase
- flatcase
- kebab-case
- PascalCase
- SCREAMING_SNAKE_CASE
- snake_case

Also, it is possible to create custom naming conventions by defining a new type that implements the `AbstractNamingConvention` interface.

## Getting Started

### Installation

```julia
julia> ] add NamingConventions
```

### Example: converting between naming conventions

```julia
using NamingConventions

# convert from snake_case to camelCase
@show NamingConventions.convert(SnakeCase, CamelCase, "snake_case") # "snakeCase"

# convert from camelCase to kebab-case
@show NamingConventions.convert(CamelCase, KebabCase, "camelCase") # "camel-case"

# convert from kebab-case to PascalCase
@show NamingConventions.convert(KebabCase, PascalCase, "kebab-case") # "KebabCase"
```

### Example: creating a custom naming convention

```julia
using NamingConventions

struct ReversePascalCase <: AbstractNamingConvention end

function NamingConventions.encode(::Type{ReversePascalCase}, v)
    return join([lowercase(first(s)) * uppercase(s[2:end]) for s in v], "")
end

function NamingConventions.decode(::Type{ReversePascalCase}, s)
    return lowercase.(split(s, r"(?<=[A-Z])(?=[a-z])|(?<=[a-z])(?=[a-z][A-Z])"))
end

@show NamingConventions.convert(CamelCase, ReversePascalCase, "camelCase") # "cAMELcASE"
@show NamingConventions.convert(SnakeCase, ReversePascalCase, "snake_case") # "sNAKEcASE"
```