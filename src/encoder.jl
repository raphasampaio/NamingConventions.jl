function encode(::Type{SnakeCase}, s::AbstractVector{<:AbstractString})::String
    return join(lowercase.(s), '_')
end

function encode(::Type{CamelCase}, s::AbstractVector{<:AbstractString})::String
    return s[1] * join(titlecase.(s[2:end]))
end

function encode(::Type{PascalCase}, s::AbstractVector{<:AbstractString})::String
    return join(titlecase.(s))
end

to_snake_case(s::AbstractString) = encode(SnakeCase, decode(s))

to_camel_case(s::AbstractString) = encode(CamelCase, decode(s))

to_pascal_case(s::AbstractString) = encode(PascalCase, decode(s))
