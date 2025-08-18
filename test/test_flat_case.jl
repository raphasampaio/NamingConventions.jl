module TestXXX

using NamingConventions
using Test

@testset "Flat Case" begin
    @test_throws DecodingError NamingConventions.convert(FlatCase, CamelCase, "flatcase")

    @test NamingConventions.convert(CamelCase, FlatCase, "camelCase") == "camel case"
    @test NamingConventions.encode(FlatCase, ["flat", "case"]) == "flat case"
    @test NamingConventions.convert(KebabCase, FlatCase, "kebab-case") == "kebab case"
    @test NamingConventions.convert(PascalCase, FlatCase, "PascalCase") == "pascal case"
    @test NamingConventions.convert(ScreamingSnakeCase, FlatCase, "SCREAMING_SNAKE_CASE") == "screaming snake case"
    @test NamingConventions.convert(SnakeCase, FlatCase, "snake_case") == "snake case"
end

end
