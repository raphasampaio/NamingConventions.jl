struct DecodingError <: Exception
    msg::String
end

function Base.showerror(io::IO, err::DecodingError)
    print(io, "DecodingError: ")
    print(io, err.msg)
end

function decode(::Type{CamelCase}, s::AbstractString)::Vector{String}
    return lowercase.(split(s, r"(?<=[a-z])(?=[A-Z])"))
end

function decode(::Type{FlatCase}, s::AbstractString)::Vector{String}
    throw(DecodingError("FlatCase cannot be decoded"))
end

function decode(::Type{KebabCase}, s::AbstractString)::Vector{String}
    return lowercase.(split(s, '-'))
end

function decode(::Type{PascalCase}, s::AbstractString)::Vector{String}
    return lowercase.(split(s, r"(?<=[a-z])(?=[A-Z])|(?<=[A-Z])(?=[A-Z][a-z])"))
end

function decode(::Type{ScreamingSnakeCase}, s::AbstractString)::Vector{String}
    return lowercase.(split(s, '_'))
end

function decode(::Type{SnakeCase}, s::AbstractString)::Vector{String}
    return lowercase.(split(s, '_'))
end
