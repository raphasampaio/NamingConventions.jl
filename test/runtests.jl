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
    @test decode("snake_case") == ["snake", "case"]
    @test decode("camelCase") == ["camel", "case"]
    @test decode("PascalCase") == ["pascal", "case"]
    return nothing
end

function test_camel_case()
    @test to_camel_case("snake_case") == "snakeCase"
    @test to_camel_case("camelCase") == "camelCase"
    @test to_camel_case("PascalCase") == "pascalCase"
    return nothing
end

function test_pascal_case()
    @test to_pascal_case("snake_case") == "SnakeCase"
    @test to_pascal_case("camelCase") == "CamelCase"
    @test to_pascal_case("PascalCase") == "PascalCase"
    return nothing
end

function test_snake_case()
    @test to_snake_case("snake_case") == "snake_case"
    @test to_snake_case("camelCase") == "camel_case"
    @test to_snake_case("PascalCase") == "pascal_case"
    return nothing
end

function test_all()
    # @testset "Aqua.jl" begin
    #     test_aqua()
    # end

    @testset "decoder" begin
        test_decoder()
    end

    @testset "camel case" begin
        test_camel_case()
    end

    @testset "pascal case" begin
        test_pascal_case()
    end

    @testset "snake case" begin
        test_snake_case()
    end

    return nothing
end

test_all()
