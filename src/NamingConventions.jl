module NamingConventions

include("abstract.jl")
include("detect.jl")
include("decoder.jl")
include("encoder.jl")
include("convert.jl")

export detect,
    decode,
    CamelCase,
    PascalCase,
    ScreamingSnakeCase,
    SnakeCase,
    KebabCase

end
