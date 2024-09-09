module NamingConventions

include("abstract.jl")
include("decoder.jl")
include("encoder.jl")
include("convert.jl")

export
    decode,
    DecodingError,
    encode,
    AbstractNamingConvention,
    CamelCase,
    FlatCase,
    KebabCase,
    PascalCase,
    ScreamingSnakeCase,
    SnakeCase

end
