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
    @test to_camel_case("camelCase") == "camelCase"
    @test to_camel_case("kebab-case") == "kebabCase"
    @test to_camel_case("PascalCase") == "pascalCase"
    @test to_camel_case("SCREAMING_SNAKE_CASE") == "screamingSnakeCase"
    @test to_camel_case("snake_case") == "snakeCase"
    return nothing
end

function test_kebab_case()
    @test to_kebab_case("camelCase") == "camel-case"
    @test to_kebab_case("kebab-case") == "kebab-case"
    @test to_kebab_case("PascalCase") == "pascal-case"
    @test to_kebab_case("SCREAMING_SNAKE_CASE") == "screaming-snake-case"
    @test to_kebab_case("snake_case") == "snake-case"
    return nothing
end

function test_pascal_case()
    @test to_pascal_case("camelCase") == "CamelCase"
    @test to_pascal_case("kebab-case") == "KebabCase"
    @test to_pascal_case("PascalCase") == "PascalCase"
    @test to_pascal_case("SCREAMING_SNAKE_CASE") == "ScreamingSnakeCase"
    @test to_pascal_case("snake_case") == "SnakeCase"
    return nothing
end

function test_screaming_snake_case()
    @test to_screaming_snake_case("camelCase") == "CAMEL_CASE"
    @test to_screaming_snake_case("kebab-case") == "KEBAB_CASE"
    @test to_screaming_snake_case("PascalCase") == "PASCAL_CASE"
    @test to_screaming_snake_case("SCREAMING_SNAKE_CASE") == "SCREAMING_SNAKE_CASE"
    @test to_screaming_snake_case("snake_case") == "SNAKE_CASE"
    return nothing
end

function test_snake_case()
    @test to_snake_case("camelCase") == "camel_case"
    @test to_snake_case("kebab-case") == "kebab_case"
    @test to_snake_case("PascalCase") == "pascal_case"
    @test to_snake_case("SCREAMING_SNAKE_CASE") == "screaming_snake_case"
    @test to_snake_case("snake_case") == "snake_case"
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
