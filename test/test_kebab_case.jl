module TestKebabCase

using NamingConventions
using Test

@testset "Kebab Case" begin
    @test NamingConventions.convert(CamelCase, KebabCase, "camelCase") == "camel-case"
    @test NamingConventions.encode(KebabCase, ["flat", "case"]) == "flat-case"
    @test NamingConventions.convert(KebabCase, KebabCase, "kebab-case") == "kebab-case"
    @test NamingConventions.convert(PascalCase, KebabCase, "PascalCase") == "pascal-case"
    @test NamingConventions.convert(ScreamingSnakeCase, KebabCase, "SCREAMING_SNAKE_CASE") == "screaming-snake-case"
    @test NamingConventions.convert(SnakeCase, KebabCase, "snake_case") == "snake-case"
end
end
