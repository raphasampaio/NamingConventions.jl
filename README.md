# NamingConventions.jl

<div align="center">
    <a href="https://raphasampaio.github.io/NamingConventions.jl/stable">
        <img src="https://img.shields.io/badge/docs-stable-blue.svg" alt="Stable">
    </a>
    <a href="https://raphasampaio.github.io/NamingConventions.jl/dev">
        <img src="https://img.shields.io/badge/docs-dev-blue.svg" alt="Dev">
    </a>
    <a href="https://github.com/JuliaTesting/Aqua.jl">
        <img src="https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg" alt="Coverage"/>
    </a>
    <br>
    <a href="https://juliahub.com/ui/Packages/General/NamingConventions">
        <img src="https://juliahub.com/docs/General/NamingConventions/stable/version.svg" alt="Version"/>
    </a>
    <a href="https://github.com/raphasampaio/NamingConventions.jl/actions/workflows/CI.yml">
        <img src="https://github.com/raphasampaio/NamingConventions.jl/actions/workflows/CI.yml/badge.svg" alt="CI"/>
    </a>
    <a href="https://codecov.io/gh/raphasampaio/NamingConventions.jl">
        <img src="https://codecov.io/gh/raphasampaio/NamingConventions.jl/branch/main/graph/badge.svg" alt="Coverage"/>
    </a>
</div>

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
