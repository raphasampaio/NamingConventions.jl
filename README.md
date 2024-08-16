# NamingConventions.jl

[![Documentation](https://img.shields.io/badge/docs-stable-blue.svg)](https://raphasampaio.github.io/NamingConventions.jl/stable)
[![CI](https://github.com/raphasampaio/NamingConventions.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/raphasampaio/NamingConventions.jl/actions/workflows/CI.yml)
[![Codecov](https://codecov.io/gh/raphasampaio/NamingConventions.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/raphasampaio/NamingConventions.jl)
[![Aqua](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)

## Introduction

This package provides a set of functions to convert between different naming conventions. The following naming conventions are supported:

- camelCase
- kebab-case
- PascalCase
- SCREAMING_SNAKE_CASE
- snake_case

## Getting Started

### Installation

```julia
julia> ] add NamingConventions
```

### Example

```julia
using NamingConventions

# Explicitly convert from snake_case to camelCase
@show convert(SnakeCase, CamelCase, "snake_case") # "snakeCase"

# Implicitly convert from snake_case to camelCase
@show convert(CamelCase, "snake_case") # "snakeCase"

```
