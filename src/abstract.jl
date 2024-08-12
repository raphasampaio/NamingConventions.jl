abstract type AbstractNamingConvention end

struct CamelCase <: AbstractNamingConvention end

struct PascalCase <: AbstractNamingConvention end

struct SnakeCase <: AbstractNamingConvention end

struct KebabCase <: AbstractNamingConvention end