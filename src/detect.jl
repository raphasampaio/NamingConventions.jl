function detect(s::AbstractString)
    if is_pascal_case(s)
        return :pascal_case
    elseif is_camel_case(s)
        return :camel_case
    elseif is_snake_case(s)
        return :snake_case
    else
        error("Unknown case format")
    end
end
