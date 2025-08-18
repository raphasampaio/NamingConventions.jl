module TestPascalCase

using NamingConventions
using Test

@testset "Pascal Case" begin
    @test NamingConventions.convert(CamelCase, PascalCase, "camelCase") == "CamelCase"
    @test NamingConventions.encode(PascalCase, ["flat", "case"]) == "FlatCase"
    @test NamingConventions.convert(KebabCase, PascalCase, "kebab-case") == "KebabCase"
    @test NamingConventions.convert(PascalCase, PascalCase, "PascalCase") == "PascalCase"
    @test NamingConventions.convert(ScreamingSnakeCase, PascalCase, "SCREAMING_SNAKE_CASE") == "ScreamingSnakeCase"
    @test NamingConventions.convert(SnakeCase, PascalCase, "snake_case") == "SnakeCase"
end
end
