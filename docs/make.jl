using Documenter
using NamingConventions

DocMeta.setdocmeta!(NamingConventions, :DocTestSetup, :(using NamingConventions); recursive = true)

makedocs(
    sitename = "NamingConventions",
    modules = [NamingConventions],
    authors = "Raphael Araujo Sampaio",
    repo = "https://github.com/raphasampaio/NamingConventions.jl/blob/{commit}{path}#{line}",
    doctest = true,
    clean = true,
    format = Documenter.HTML(
        prettyurls = get(ENV, "CI", "false") == "true",
        canonical = "https://raphasampaio.github.io/NamingConventions.jl",
        edit_link = "main",
        # assets = [
        #     "assets/favicon.ico",
        # ],
    ),
    pages = [
        "Home" => "index.md",
    ],
)

deploydocs(
    repo = "github.com/raphasampaio/NamingConventions.jl.git",
    devbranch = "main",
    push_preview = true,
)
