module TestCamelCase

using NamingConventions
using Test

@testset "Camel Case" begin
    @test NamingConventions.convert(CamelCase, CamelCase, "camelCase") == "camelCase"
    @test NamingConventions.encode(CamelCase, ["flat", "case"]) == "flatCase"
    @test NamingConventions.convert(KebabCase, CamelCase, "kebab-case") == "kebabCase"
    @test NamingConventions.convert(PascalCase, CamelCase, "PascalCase") == "pascalCase"
    @test NamingConventions.convert(ScreamingSnakeCase, CamelCase, "SCREAMING_SNAKE_CASE") == "screamingSnakeCase"
    @test NamingConventions.convert(SnakeCase, CamelCase, "snake_case") == "snakeCase"
end

end
