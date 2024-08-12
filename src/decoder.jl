function decode(s::AbstractString)::Vector{String}
    @show case = detect(s)

    if case == :snake_case
        return from_snake_case(s)
    elseif case == :camel_case
        return from_camel_case(s)
    # elseif case == :pascal_case
    #     return from_pascal_case(s)
    else
        error("Invalid case $case")
    end
end

function from_snake_case(s::AbstractString)::Vector{String}
    return split(s, '_')
end

function from_camel_case(s::AbstractString)::Vector{String}
    return split(s, r"(?<=[a-z])(?=[A-Z])")
end

function from_pascal_case(s::AbstractString)::Vector{String}
    parts = []
    i = 1
    while i <= length(s)
        j = i
        while j <= length(s) && islowercase(s[j])
            j += 1
        end
        push!(parts, s[i:j-1])
        i = j
    end
    return parts
end