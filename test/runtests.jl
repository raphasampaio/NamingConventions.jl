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
    return nothing
end

function test_camel_case()
    @test convert(CamelCase, CamelCase, "camelCase") == "camelCase"
    @test convert(KebabCase, CamelCase, "kebab-case") == "kebabCase"
    @test convert(PascalCase, CamelCase, "PascalCase") == "pascalCase"
    @test convert(ScreamingSnakeCase, CamelCase, "SCREAMING_SNAKE_CASE") == "screamingSnakeCase"
    @test convert(SnakeCase, CamelCase, "snake_case") == "snakeCase"

    @test convert(CamelCase, "camelCase") == "camelCase"
    @test convert(CamelCase, "kebab-case") == "kebabCase"
    @test convert(CamelCase, "PascalCase") == "pascalCase"
    @test convert(CamelCase, "SCREAMING_SNAKE_CASE") == "screamingSnakeCase"
    @test convert(CamelCase, "snake_case") == "snakeCase"
    return nothing
end

function test_kebab_case()
    @test convert(CamelCase, KebabCase, "camelCase") == "camel-case"
    @test convert(KebabCase, KebabCase, "kebab-case") == "kebab-case"
    @test convert(PascalCase, KebabCase, "PascalCase") == "pascal-case"
    @test convert(ScreamingSnakeCase, KebabCase, "SCREAMING_SNAKE_CASE") == "screaming-snake-case"
    @test convert(SnakeCase, KebabCase, "snake_case") == "snake-case"

    @test convert(KebabCase, "camelCase") == "camel-case"
    @test convert(KebabCase, "kebab-case") == "kebab-case"
    @test convert(KebabCase, "PascalCase") == "pascal-case"
    @test convert(KebabCase, "SCREAMING_SNAKE_CASE") == "screaming-snake-case"
    @test convert(KebabCase, "snake_case") == "snake-case"

    return nothing
end

function test_pascal_case()
    @test convert(CamelCase, PascalCase, "camelCase") == "CamelCase"
    @test convert(KebabCase, PascalCase, "kebab-case") == "KebabCase"
    @test convert(PascalCase, PascalCase, "PascalCase") == "PascalCase"
    @test convert(ScreamingSnakeCase, PascalCase, "SCREAMING_SNAKE_CASE") == "ScreamingSnakeCase"
    @test convert(SnakeCase, PascalCase, "snake_case") == "SnakeCase"

    @test convert(PascalCase, "camelCase") == "CamelCase"
    @test convert(PascalCase, "kebab-case") == "KebabCase"
    @test convert(PascalCase, "PascalCase") == "PascalCase"
    @test convert(PascalCase, "SCREAMING_SNAKE_CASE") == "ScreamingSnakeCase"
    @test convert(PascalCase, "snake_case") == "SnakeCase"

    return nothing
end

function test_screaming_snake_case()
    @test convert(CamelCase, ScreamingSnakeCase, "camelCase") == "CAMEL_CASE"
    @test convert(KebabCase, ScreamingSnakeCase, "kebab-case") == "KEBAB_CASE"
    @test convert(PascalCase, ScreamingSnakeCase, "PascalCase") == "PASCAL_CASE"
    @test convert(ScreamingSnakeCase, ScreamingSnakeCase, "SCREAMING_SNAKE_CASE") == "SCREAMING_SNAKE_CASE"
    @test convert(SnakeCase, ScreamingSnakeCase, "snake_case") == "SNAKE_CASE"

    @test convert(ScreamingSnakeCase, "camelCase") == "CAMEL_CASE"
    @test convert(ScreamingSnakeCase, "kebab-case") == "KEBAB_CASE"
    @test convert(ScreamingSnakeCase, "PascalCase") == "PASCAL_CASE"
    @test convert(ScreamingSnakeCase, "SCREAMING_SNAKE_CASE") == "SCREAMING_SNAKE_CASE"
    @test convert(ScreamingSnakeCase, "snake_case") == "SNAKE_CASE"

    return nothing
end

function test_snake_case()
    @test convert(CamelCase, SnakeCase, "camelCase") == "camel_case"
    @test convert(KebabCase, SnakeCase, "kebab-case") == "kebab_case"
    @test convert(PascalCase, SnakeCase, "PascalCase") == "pascal_case"
    @test convert(ScreamingSnakeCase, SnakeCase, "SCREAMING_SNAKE_CASE") == "screaming_snake_case"
    @test convert(SnakeCase, SnakeCase, "snake_case") == "snake_case"

    @test convert(SnakeCase, "camelCase") == "camel_case"
    @test convert(SnakeCase, "kebab-case") == "kebab_case"
    @test convert(SnakeCase, "PascalCase") == "pascal_case"
    @test convert(SnakeCase, "SCREAMING_SNAKE_CASE") == "screaming_snake_case"
    @test convert(SnakeCase, "snake_case") == "snake_case"

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
