using NamingConventions

using Aqua
using Test

include("aqua.jl")
include("custom.jl")

function test_camel_case()
    @test NamingConventions.convert(CamelCase, CamelCase, "camelCase") == "camelCase"
    @test NamingConventions.encode(CamelCase, ["flat", "case"]) == "flatCase"
    @test NamingConventions.convert(KebabCase, CamelCase, "kebab-case") == "kebabCase"
    @test NamingConventions.convert(PascalCase, CamelCase, "PascalCase") == "pascalCase"
    @test NamingConventions.convert(ScreamingSnakeCase, CamelCase, "SCREAMING_SNAKE_CASE") == "screamingSnakeCase"
    @test NamingConventions.convert(SnakeCase, CamelCase, "snake_case") == "snakeCase"

    return nothing
end

function test_flat_case()
    @test_throws DecodingError NamingConventions.convert(FlatCase, CamelCase, "flatcase")

    @test NamingConventions.convert(CamelCase, FlatCase, "camelCase") == "camel case"
    @test NamingConventions.encode(FlatCase, ["flat", "case"]) == "flat case"
    @test NamingConventions.convert(KebabCase, FlatCase, "kebab-case") == "kebab case"
    @test NamingConventions.convert(PascalCase, FlatCase, "PascalCase") == "pascal case"
    @test NamingConventions.convert(ScreamingSnakeCase, FlatCase, "SCREAMING_SNAKE_CASE") == "screaming snake case"
    @test NamingConventions.convert(SnakeCase, FlatCase, "snake_case") == "snake case"

    return nothing
end

function test_kebab_case()
    @test NamingConventions.convert(CamelCase, KebabCase, "camelCase") == "camel-case"
    @test NamingConventions.encode(KebabCase, ["flat", "case"]) == "flat-case"
    @test NamingConventions.convert(KebabCase, KebabCase, "kebab-case") == "kebab-case"
    @test NamingConventions.convert(PascalCase, KebabCase, "PascalCase") == "pascal-case"
    @test NamingConventions.convert(ScreamingSnakeCase, KebabCase, "SCREAMING_SNAKE_CASE") == "screaming-snake-case"
    @test NamingConventions.convert(SnakeCase, KebabCase, "snake_case") == "snake-case"

    return nothing
end

function test_pascal_case()
    @test NamingConventions.convert(CamelCase, PascalCase, "camelCase") == "CamelCase"
    @test NamingConventions.encode(PascalCase, ["flat", "case"]) == "FlatCase"
    @test NamingConventions.convert(KebabCase, PascalCase, "kebab-case") == "KebabCase"
    @test NamingConventions.convert(PascalCase, PascalCase, "PascalCase") == "PascalCase"
    @test NamingConventions.convert(ScreamingSnakeCase, PascalCase, "SCREAMING_SNAKE_CASE") == "ScreamingSnakeCase"
    @test NamingConventions.convert(SnakeCase, PascalCase, "snake_case") == "SnakeCase"

    return nothing
end

function test_screaming_snake_case()
    @test NamingConventions.convert(CamelCase, ScreamingSnakeCase, "camelCase") == "CAMEL_CASE"
    @test NamingConventions.encode(ScreamingSnakeCase, ["flat", "case"]) == "FLAT_CASE"
    @test NamingConventions.convert(KebabCase, ScreamingSnakeCase, "kebab-case") == "KEBAB_CASE"
    @test NamingConventions.convert(PascalCase, ScreamingSnakeCase, "PascalCase") == "PASCAL_CASE"
    @test NamingConventions.convert(ScreamingSnakeCase, ScreamingSnakeCase, "SCREAMING_SNAKE_CASE") == "SCREAMING_SNAKE_CASE"
    @test NamingConventions.convert(SnakeCase, ScreamingSnakeCase, "snake_case") == "SNAKE_CASE"

    return nothing
end

function test_snake_case()
    @test NamingConventions.convert(CamelCase, SnakeCase, "camelCase") == "camel_case"
    @test NamingConventions.encode(SnakeCase, ["flat", "case"]) == "flat_case"
    @test NamingConventions.convert(KebabCase, SnakeCase, "kebab-case") == "kebab_case"
    @test NamingConventions.convert(PascalCase, SnakeCase, "PascalCase") == "pascal_case"
    @test NamingConventions.convert(ScreamingSnakeCase, SnakeCase, "SCREAMING_SNAKE_CASE") == "screaming_snake_case"
    @test NamingConventions.convert(SnakeCase, SnakeCase, "snake_case") == "snake_case"

    return nothing
end

function test_all()
    @testset "Aqua.jl" begin
        test_aqua()
    end

    @testset "camel case" begin
        test_camel_case()
    end

    @testset "flat case" begin
        test_flat_case()
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

    @testset "custom case" begin
        test_custom_case()
    end

    return nothing
end

test_all()
