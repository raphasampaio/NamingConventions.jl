function decode(s::AbstractString)::Vector{String}
    return decode(detect(s), s)
end

function decode(::Type{SnakeCase}, s::AbstractString)::Vector{String}
    return lowercase.(split(s, '_'))
end

function decode(::Type{CamelCase}, s::AbstractString)::Vector{String}
    return lowercase.(split(s, r"(?<=[a-z])(?=[A-Z])"))
end

function decode(::Type{PascalCase}, s::AbstractString)::Vector{String}
    return lowercase.(split(s, r"(?<=[a-z])(?=[A-Z])|(?<=[A-Z])(?=[A-Z][a-z])"))
end
