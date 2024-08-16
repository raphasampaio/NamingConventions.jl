module NamingConventions

include("abstract.jl")
include("detect.jl")
include("decoder.jl")
include("encoder.jl")
include("convert.jl")

export detect,
    decode,
    encode,
    AbstractNamingConvention,
    CamelCase,
    FlatCase,
    KebabCase,
    PascalCase,
    ScreamingSnakeCase,
    SnakeCase,
    InvalidNamingConvention

end
