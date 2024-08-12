module NamingConventions

include("abstract.jl")
include("detect.jl")
include("decoder.jl")
include("encoder.jl")

export detect,
    decode,
    to_snake_case,
    to_camel_case,
    to_pascal_case

end
