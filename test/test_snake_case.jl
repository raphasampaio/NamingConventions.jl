module TestSnakeCase

using NamingConventions
using Test

@testset "Snake Case" begin
    @test NamingConventions.convert(CamelCase, SnakeCase, "camelCase") == "camel_case"
    @test NamingConventions.encode(SnakeCase, ["flat", "case"]) == "flat_case"
    @test NamingConventions.convert(KebabCase, SnakeCase, "kebab-case") == "kebab_case"
    @test NamingConventions.convert(PascalCase, SnakeCase, "PascalCase") == "pascal_case"
    @test NamingConventions.convert(ScreamingSnakeCase, SnakeCase, "SCREAMING_SNAKE_CASE") == "screaming_snake_case"
    @test NamingConventions.convert(SnakeCase, SnakeCase, "snake_case") == "snake_case"
end

end