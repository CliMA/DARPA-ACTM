# reference in tree version of CalibrateEmulateSample

using Documenter, Literate
using DocumenterCitations

# Gotta set this environment variable when using the GR run-time on CI machines.
# This happens as examples will use Plots.jl to make plots and movies.
# See: https://github.com/jheinen/GR.jl/issues/278
ENV["GKSwstype"] = "100"

bib = CitationBibliography(joinpath(@__DIR__, "docs/bibliography.bib"))

const OUTPUT_DIR = joinpath(@__DIR__, "src/literated")

#----------

pages = [
    "Home" => "index.md",
    "Our Team" => "people.md",
    "References" => "References.md",
]

#----------

format = Documenter.HTML(collapselevel = 1, prettyurls = !isempty(get(ENV, "CI", "")))

makedocs(
    bib,
    sitename = "CliMA DARPA-ACTM",
    authors = "CliMA Contributors",
    format = format,
    pages = pages,
    # modules = [EnsembleKalmanProcesses],
    doctest = true,
    strict = true,
    clean = true,
    checkdocs = :none,
)

if !isempty(get(ENV, "CI", ""))
    deploydocs(
        repo = "github.com/CliMA/DARPA-ACTM.git",
        versions = ["stable" => "v^", "v#.#.#", "dev" => "dev"],
        push_preview = true,
        devbranch = "main",
    )
end
