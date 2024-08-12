module NamingConventions

include("camel_case.jl")
include("pascal_case.jl")
include("snake_case.jl")
include("detect.jl")

export detect,
    is_camel_case,
    is_pascal_case,
    is_snake_case,
    to_camel_case,
    to_pascal_case,
    to_snake_case

end
