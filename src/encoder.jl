function encode(::Type{CamelCase}, v::AbstractVector{<:AbstractString})::String
    return v[1] * join(titlecase.(v[2:end]))
end

function encode(::Type{FlatCase}, v::AbstractVector{<:AbstractString})::String
    return join(lowercase.(v), ' ')
end

function encode(::Type{KebabCase}, v::AbstractVector{<:AbstractString})::String
    return join(lowercase.(v), '-')
end

function encode(::Type{PascalCase}, v::AbstractVector{<:AbstractString})::String
    return join(titlecase.(v))
end

function encode(::Type{ScreamingSnakeCase}, v::AbstractVector{<:AbstractString})::String
    return join(uppercase.(v), '_')
end

function encode(::Type{SnakeCase}, v::AbstractVector{<:AbstractString})::String
    return join(lowercase.(v), '_')
end
