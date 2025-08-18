module TestAqua

using Aqua
using NamingConventions
using Test

@testset "Aqua" begin
    Aqua.test_ambiguities(NamingConventions, recursive = false)
    Aqua.test_all(NamingConventions, ambiguities = false)
    return nothing
end

end
