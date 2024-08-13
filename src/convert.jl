function Base.convert(from::Type{<:AbstractNamingConvention}, to::Type{<:AbstractNamingConvention}, s::AbstractString)::String
    return encode(to, decode(from, s))
end

function Base.convert(to::Type{<:AbstractNamingConvention}, s::AbstractString)::String
    return encode(to, decode(s))
end
