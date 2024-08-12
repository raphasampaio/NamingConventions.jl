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

function test_decoder()
    @test decode("snake_case") == ["snake", "case"]
    @test decode("camelCase") == ["camel", "Case"]
    # @test decode("PascalCase") == ["Pascal", "Case"]

    return nothing
end

# function test_camel_case()

#     return nothing
# end

# function test_pascal_case()
#     return nothing
# end

# function test_snake_case()
#     @test to_snake_case("snake_case") == "snake_case"
#     @test to_snake_case("camelCase") == "camel_case"
#     @test to_snake_case("PascalCase") == "pascal_case"

#     return nothing
# end

function test_all()
    # @testset "Aqua.jl" begin
    #     test_aqua()
    # end

    @testset "decoder" begin
        test_decoder()
    end

    # @testset "pascal case" begin
    #     test_pascal_case()
    # end

    # @testset "snake case" begin
    #     test_snake_case()
    # end

    return nothing
end

test_all()
