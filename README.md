# NamingConventions.jl

[![CI](https://github.com/raphasampaio/NamingConventions.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/raphasampaio/NamingConventions.jl/actions/workflows/CI.yml)
[![codecov](https://codecov.io/gh/raphasampaio/NamingConventions.jl/graph/badge.svg?token=7tA9ajgsLf)](https://codecov.io/gh/raphasampaio/NamingConventions.jl)
[![Aqua](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)

## Introduction

NamingConventions.jl is a lightweight and flexible Julia package that facilitates the conversion between various naming conventions commonly used in programming. The package supports the following conventions out-of-the-box:

- `CamelCase`: e.g., youTube
- `FlatCase`: e.g., youtube
- `KebabCase`: e.g., you-tube
- `PascalCase`: e.g., YouTube
- `ScreamingSnakeCase`: e.g., YOU_TUBE
- `SnakeCase`: e.g., you_tube

The flexibility of this package lies in its extensibility. By implementing your own encoding and decoding logic, you can create tailored naming conventions that fit your specific needs. All you need to do is define a new type that inherits from `AbstractNamingConvention` and implement the encode and decode functions.

## Getting Started

### Installation

```julia
julia> ] add NamingConventions
```

### Example 1: Converting Between Naming Conventions

Here is how you can easily convert between different naming styles:

```julia
using NamingConventions

# convert from snake_case to camelCase
@show NamingConventions.convert(SnakeCase, CamelCase, "snake_case") # output: "snakeCase"

# convert from camelCase to kebab-case
@show NamingConventions.convert(CamelCase, KebabCase, "camelCase") # output: "camel-case"

# convert from kebab-case to PascalCase
@show NamingConventions.convert(KebabCase, PascalCase, "kebab-case") # output: "KebabCase"
```

### Example 2: Defining a Custom Naming Convention

You can define your own naming conventions by creating a new type and implementing the required methods:

```julia
using NamingConventions

struct ReversePascalCase <: AbstractNamingConvention end

function NamingConventions.encode(::Type{ReversePascalCase}, v)
    return join([lowercase(first(s)) * uppercase(s[2:end]) for s in v], "")
end

function NamingConventions.decode(::Type{ReversePascalCase}, s)
    return lowercase.(split(s, r"(?<=[A-Z])(?=[a-z])|(?<=[a-z])(?=[a-z][A-Z])"))
end

# convert from camelCase to ReversePascalCase
@show NamingConventions.convert(CamelCase, ReversePascalCase, "camelCase") # output: "cAMELcASE"

# convert from snake_case to ReversePascalCase
@show NamingConventions.convert(SnakeCase, ReversePascalCase, "snake_case") # output: "sNAKEcASE"
```

## Contributing

Contributions, bug reports, and feature requests are welcome! Feel free to open an issue or submit a pull request.