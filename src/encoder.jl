function to_snake_case(s::Vector{String})::String
    return join(lowercase.(s), '_')
end

function to_camel_case(s::Vector{String})::String
    return s[1] * join(capitalize.(s[2:end]))
end

function to_pascal_case(s::Vector{String})::String
    return join(capitalize.(s))
end

to_snake_case(s::AbstractString) = to_snake_case(decode(s))

to_camel_case(s::AbstractString) = to_camel_case(decode(s))

to_pascal_case(s::AbstractString) = to_pascal_case(decode(s))