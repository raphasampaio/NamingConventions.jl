function encode(::Type{CamelCase}, v::AbstractVector{<:AbstractString})::String
    return s[1] * join(titlecase.(s[2:end]))
end

function encode(::Type{FlatCase}, v::AbstractVector{<:AbstractString})::String
    return join(lowercase.(s), ' ')
end

function encode(::Type{KebabCase}, v::AbstractVector{<:AbstractString})::String
    return join(lowercase.(s), '-')
end

function encode(::Type{PascalCase}, v::AbstractVector{<:AbstractString})::String
    return join(titlecase.(s))
end

function encode(::Type{ScreamingSnakeCase}, v::AbstractVector{<:AbstractString})::String
    return join(uppercase.(s), '_')
end

function encode(::Type{SnakeCase}, v::AbstractVector{<:AbstractString})::String
    return join(lowercase.(s), '_')
end
