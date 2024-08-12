function encode(::Type{CamelCase}, s::AbstractVector{<:AbstractString})::String
    return s[1] * join(titlecase.(s[2:end]))
end

function encode(::Type{KebabCase}, s::AbstractVector{<:AbstractString})::String
    return join(lowercase.(s), '-')
end

function encode(::Type{PascalCase}, s::AbstractVector{<:AbstractString})::String
    return join(titlecase.(s))
end

function encode(::Type{ScreamingSnakeCase}, s::AbstractVector{<:AbstractString})::String
    return join(uppercase.(s), '_')
end

function encode(::Type{SnakeCase}, s::AbstractVector{<:AbstractString})::String
    return join(lowercase.(s), '_')
end

to_camel_case(s::AbstractString) = encode(CamelCase, decode(s))

to_kebab_case(s::AbstractString) = encode(KebabCase, decode(s))

to_pascal_case(s::AbstractString) = encode(PascalCase, decode(s))

to_screaming_snake_case(s::AbstractString) = encode(ScreamingSnakeCase, decode(s))

to_snake_case(s::AbstractString) = encode(SnakeCase, decode(s))
