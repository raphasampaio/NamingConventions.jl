abstract type AbstractNamingConvention end

struct CamelCase <: AbstractNamingConvention end

struct FlatCase <: AbstractNamingConvention end

struct KebabCase <: AbstractNamingConvention end

struct PascalCase <: AbstractNamingConvention end

struct ScreamingSnakeCase <: AbstractNamingConvention end

struct SnakeCase <: AbstractNamingConvention end
