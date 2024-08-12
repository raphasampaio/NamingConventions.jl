

function to_snake_case(s::AbstractString)
    current_case = detect(s)

    if current_case == :snake_case
        return s
    elseif current_case == :camel_case
        return lowercase(replace(s, r"([a-z])([A-Z])" => s"\1_\2"))
    elseif current_case == :pascal_case
        return lowercase(replace(s, r"([A-Z])" => "_\1"))[2:end]
    else
        error("Unsupported case format")
    end
end

