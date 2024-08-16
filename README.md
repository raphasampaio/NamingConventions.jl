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

## Getting Started

### Installation

```julia
julia> ] add NamingConventions
```

### Example: converting between naming conventions

```julia
using NamingConventions

# Explicitly convert from snake_case to camelCase
@show NamingConventions.convert(SnakeCase, CamelCase, "snake_case") # "snakeCase"

# Implicitly convert from snake_case to camelCase
@show NamingConventions.convert(CamelCase, "snake_case") # "snakeCase"
```
