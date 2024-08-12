function is(::Type{CamelCase}, s::AbstractString)
    return occursin(r"^[a-z]+([A-Z][a-z0-9]*)*$", s)
end

function is(::Type{KebabCase}, s::AbstractString)
    return occursin(r"^[a-z]+(-[a-z0-9]+)*$", s)
end

function is(::Type{PascalCase}, s::AbstractString)
    return occursin(r"^[A-Z][a-z0-9]*([A-Z][a-z0-9]*)*$", s)
end

function is(::Type{SnakeCase}, s::AbstractString)
    return occursin(r"^[a-z0-9]+(_[a-z0-9]+)*$", s)
end

function detect(s::AbstractString)
    subtypes = [CamelCase, KebabCase, PascalCase, SnakeCase]

    for subtype in subtypes
        if is(subtype, s)
            return subtype
        end
    end

    error("Unknown case format")
    return nothing
end
