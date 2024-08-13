# NamingConventions

## Installation

```julia
using Pkg
Pkg.add("NamingConventions")
```

## Introduction

This package provides a set of functions to convert between different naming conventions. The following naming conventions are supported:

- camelCase
- kebab-case
- PascalCase
- SCREAMING_SNAKE_CASE
- snake_case

## Getting Started

### Explicit Conversion

```julia
using NamingConventions

@show convert(SnakeCase, PascalCase, "you_tube") # "YouTube"
@show convert(SnakeCase, CamelCase, "you_tube") # "youTube"
@show convert(SnakeCase, KebabCase, "you_tube") # "you-tube"
@show convert(SnakeCase, ScreamingSnakeCase, "you_tube") # "YOU_TUBE"
```

### Implicit Conversion

```julia
using NamingConventions

@show convert(PascalCase, "you_tube") # "YouTube"
@show convert(CamelCase, "you_tube") # "youTube"
@show convert(KebabCase, "you_tube") # "you-tube"
@show convert(ScreamingSnakeCase, "you_tube") # "YOU_TUBE"
```
