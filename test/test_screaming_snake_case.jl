module TestScreamingSnakeCase

using NamingConventions
using Test

@testset "Screaming Snake Case" begin
    @test NamingConventions.convert(CamelCase, ScreamingSnakeCase, "camelCase") == "CAMEL_CASE"
    @test NamingConventions.encode(ScreamingSnakeCase, ["flat", "case"]) == "FLAT_CASE"
    @test NamingConventions.convert(KebabCase, ScreamingSnakeCase, "kebab-case") == "KEBAB_CASE"
    @test NamingConventions.convert(PascalCase, ScreamingSnakeCase, "PascalCase") == "PASCAL_CASE"
    @test NamingConventions.convert(ScreamingSnakeCase, ScreamingSnakeCase, "SCREAMING_SNAKE_CASE") ==
          "SCREAMING_SNAKE_CASE"
    @test NamingConventions.convert(SnakeCase, ScreamingSnakeCase, "snake_case") == "SNAKE_CASE"
end

end
