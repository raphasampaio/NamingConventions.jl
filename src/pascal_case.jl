function is_pascal_case(s::AbstractString)
    return occursin(r"^[A-Z][a-z0-9]*([A-Z][a-z0-9]*)*$", s)
end

# function snake_to_pascal(s::String)
#     return join(capitalize.(split(s, '_')))
# end