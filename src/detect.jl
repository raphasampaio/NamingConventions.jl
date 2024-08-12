function is_camel_case(s::AbstractString)
    return occursin(r"^[a-z]+([A-Z][a-z0-9]*)*$", s)
end

function is_pascal_case(s::AbstractString)
    return occursin(r"^[A-Z][a-z0-9]*([A-Z][a-z0-9]*)*$", s)
end

function is_snake_case(s::AbstractString)
    return occursin(r"^[a-z0-9]+(_[a-z0-9]+)*$", s)
end

function detect(s::AbstractString)
    if is_pascal_case(s)
        return PascalCase
    elseif is_camel_case(s)
        return CamelCase
    elseif is_snake_case(s)
        return SnakeCase
    else
        error("Unknown case format")
    end
end
