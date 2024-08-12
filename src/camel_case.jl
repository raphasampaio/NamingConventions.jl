function is_camel_case(s::String)
    return occursin(r"^[a-z]+([A-Z][a-z0-9]*)*$", s)
end

# function snake_to_camel(s::String)
#     parts = split(s, '_')
#     return parts[1] * join(capitalize.(parts[2:end]))
# end