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

# @test detect_case("PascalCase") == :pascal
# @test detect_case("camelCase") == :camel
# @test detect_case("snake_case") == :snake

# @test convert_case("PascalCase", :snake) == "pascal_case"
# @test convert_case("camelCase", :snake) == "camel_case"
# @test convert_case("snake_case", :camel) == "snakeCase"
# @test convert_case("snake_case", :pascal) == "SnakeCase"
# @test convert_case("PascalCase", :camel) == "pascalCase"



function test_camel_case()
    @test detect("camelCase") == :camel_case
    @test is_camel_case("snake_case") == false
    @test is_camel_case("camelCase") == true
    @test is_camel_case("PascalCase") == false

    return nothing
end

function test_pascal_case()
    @test detect("PascalCase") == :pascal_case
    @test is_pascal_case("snake_case") == false
    @test is_pascal_case("camelCase") == false
    @test is_pascal_case("PascalCase") == true

    return nothing
end

function test_snake_case()
    @test detect("snake_case") == :snake_case

    @test is_snake_case("snake_case") == true
    @test is_snake_case("camelCase") == false
    @test is_snake_case("PascalCase") == false

    @test to_snake_case("snake_case") == "snake_case"
    @test to_snake_case("camelCase") == "camel_case"
    @test to_snake_case("PascalCase") == "pascal_case"

    return nothing
end

function test_all()
    # @testset "Aqua.jl" begin
    #     test_aqua()
    # end

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
