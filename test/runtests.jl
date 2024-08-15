using NamingConventions

using Aqua
using Test

function test_aqua()
    @testset "Ambiguities" begin
        Aqua.test_ambiguities(NamingConventions, recursive = false)
    end
    Aqua.test_all(NamingConventions, ambiguities = false)

    return nothing
end

function test_decoder()
    @test decode("camelCase") == ["camel", "case"]
    @test decode("kebab-case") == ["kebab", "case"]
    @test decode("PascalCase") == ["pascal", "case"]
    @test decode("SCREAMING_SNAKE_CASE") == ["screaming", "snake", "case"]
    @test decode("snake_case") == ["snake", "case"]

    @test_throws InvalidNamingConvention decode("camelCase-snake_case")

    return nothing
end

function test_camel_case()
    @test NamingConventions.convert(CamelCase, CamelCase, "camelCase") == "camelCase"
    @test NamingConventions.convert(KebabCase, CamelCase, "kebab-case") == "kebabCase"
    @test NamingConventions.convert(PascalCase, CamelCase, "PascalCase") == "pascalCase"
    @test NamingConventions.convert(ScreamingSnakeCase, CamelCase, "SCREAMING_SNAKE_CASE") == "screamingSnakeCase"
    @test NamingConventions.convert(SnakeCase, CamelCase, "snake_case") == "snakeCase"

    @test NamingConventions.convert(CamelCase, "camelCase") == "camelCase"
    @test NamingConventions.convert(CamelCase, "kebab-case") == "kebabCase"
    @test NamingConventions.convert(CamelCase, "PascalCase") == "pascalCase"
    @test NamingConventions.convert(CamelCase, "SCREAMING_SNAKE_CASE") == "screamingSnakeCase"
    @test NamingConventions.convert(CamelCase, "snake_case") == "snakeCase"
    return nothing
end

function test_kebab_case()
    @test NamingConventions.convert(CamelCase, KebabCase, "camelCase") == "camel-case"
    @test NamingConventions.convert(KebabCase, KebabCase, "kebab-case") == "kebab-case"
    @test NamingConventions.convert(PascalCase, KebabCase, "PascalCase") == "pascal-case"
    @test NamingConventions.convert(ScreamingSnakeCase, KebabCase, "SCREAMING_SNAKE_CASE") == "screaming-snake-case"
    @test NamingConventions.convert(SnakeCase, KebabCase, "snake_case") == "snake-case"

    @test NamingConventions.convert(KebabCase, "camelCase") == "camel-case"
    @test NamingConventions.convert(KebabCase, "kebab-case") == "kebab-case"
    @test NamingConventions.convert(KebabCase, "PascalCase") == "pascal-case"
    @test NamingConventions.convert(KebabCase, "SCREAMING_SNAKE_CASE") == "screaming-snake-case"
    @test NamingConventions.convert(KebabCase, "snake_case") == "snake-case"

    return nothing
end

function test_pascal_case()
    @test NamingConventions.convert(CamelCase, PascalCase, "camelCase") == "CamelCase"
    @test NamingConventions.convert(KebabCase, PascalCase, "kebab-case") == "KebabCase"
    @test NamingConventions.convert(PascalCase, PascalCase, "PascalCase") == "PascalCase"
    @test NamingConventions.convert(ScreamingSnakeCase, PascalCase, "SCREAMING_SNAKE_CASE") == "ScreamingSnakeCase"
    @test NamingConventions.convert(SnakeCase, PascalCase, "snake_case") == "SnakeCase"

    @test NamingConventions.convert(PascalCase, "camelCase") == "CamelCase"
    @test NamingConventions.convert(PascalCase, "kebab-case") == "KebabCase"
    @test NamingConventions.convert(PascalCase, "PascalCase") == "PascalCase"
    @test NamingConventions.convert(PascalCase, "SCREAMING_SNAKE_CASE") == "ScreamingSnakeCase"
    @test NamingConventions.convert(PascalCase, "snake_case") == "SnakeCase"

    return nothing
end

function test_screaming_snake_case()
    @test NamingConventions.convert(CamelCase, ScreamingSnakeCase, "camelCase") == "CAMEL_CASE"
    @test NamingConventions.convert(KebabCase, ScreamingSnakeCase, "kebab-case") == "KEBAB_CASE"
    @test NamingConventions.convert(PascalCase, ScreamingSnakeCase, "PascalCase") == "PASCAL_CASE"
    @test NamingConventions.convert(ScreamingSnakeCase, ScreamingSnakeCase, "SCREAMING_SNAKE_CASE") == "SCREAMING_SNAKE_CASE"
    @test NamingConventions.convert(SnakeCase, ScreamingSnakeCase, "snake_case") == "SNAKE_CASE"

    @test NamingConventions.convert(ScreamingSnakeCase, "camelCase") == "CAMEL_CASE"
    @test NamingConventions.convert(ScreamingSnakeCase, "kebab-case") == "KEBAB_CASE"
    @test NamingConventions.convert(ScreamingSnakeCase, "PascalCase") == "PASCAL_CASE"
    @test NamingConventions.convert(ScreamingSnakeCase, "SCREAMING_SNAKE_CASE") == "SCREAMING_SNAKE_CASE"
    @test NamingConventions.convert(ScreamingSnakeCase, "snake_case") == "SNAKE_CASE"

    return nothing
end

function test_snake_case()
    @test NamingConventions.convert(CamelCase, SnakeCase, "camelCase") == "camel_case"
    @test NamingConventions.convert(KebabCase, SnakeCase, "kebab-case") == "kebab_case"
    @test NamingConventions.convert(PascalCase, SnakeCase, "PascalCase") == "pascal_case"
    @test NamingConventions.convert(ScreamingSnakeCase, SnakeCase, "SCREAMING_SNAKE_CASE") == "screaming_snake_case"
    @test NamingConventions.convert(SnakeCase, SnakeCase, "snake_case") == "snake_case"

    @test NamingConventions.convert(SnakeCase, "camelCase") == "camel_case"
    @test NamingConventions.convert(SnakeCase, "kebab-case") == "kebab_case"
    @test NamingConventions.convert(SnakeCase, "PascalCase") == "pascal_case"
    @test NamingConventions.convert(SnakeCase, "SCREAMING_SNAKE_CASE") == "screaming_snake_case"
    @test NamingConventions.convert(SnakeCase, "snake_case") == "snake_case"

    return nothing
end

function test_all()
    @testset "Aqua.jl" begin
        test_aqua()
    end

    @testset "decoder" begin
        test_decoder()
    end

    @testset "camel case" begin
        test_camel_case()
    end

    @testset "kebab case" begin
        test_kebab_case()
    end

    @testset "pascal case" begin
        test_pascal_case()
    end

    @testset "screaming snake case" begin
        test_screaming_snake_case()
    end

    @testset "snake case" begin
        test_snake_case()
    end

    return nothing
end

test_all()
