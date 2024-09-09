struct ReversePascalCase <: AbstractNamingConvention end

function NamingConventions.encode(::Type{ReversePascalCase}, v::AbstractVector{<:AbstractString})::String
    return join([lowercase(first(s)) * uppercase(s[2:end]) for s in v], "")
end

function NamingConventions.decode(::Type{ReversePascalCase}, s::AbstractString)::Vector{String}
    return lowercase.(split(s, r"(?<=[A-Z])(?=[a-z])|(?<=[a-z])(?=[a-z][A-Z])"))
end

function test_custom_case()
    @test NamingConventions.convert(CamelCase, ReversePascalCase, "camelCase") == "cAMELcASE"
    @test NamingConventions.encode(ReversePascalCase, ["flat", "case"]) == "fLATcASE"
    @test NamingConventions.convert(KebabCase, ReversePascalCase, "kebab-case") == "kEBABcASE"
    @test NamingConventions.convert(PascalCase, ReversePascalCase, "PascalCase") == "pASCALcASE"
    @test NamingConventions.convert(ReversePascalCase, ReversePascalCase, "rEVERSEpASCALcASE") == "rEVERSEpASCALcASE"
    @test NamingConventions.convert(ScreamingSnakeCase, ReversePascalCase, "SCREAMING_SNAKE_CASE") == "sCREAMINGsNAKEcASE"
    @test NamingConventions.convert(SnakeCase, ReversePascalCase, "snake_case") == "sNAKEcASE"

    return nothing
end
