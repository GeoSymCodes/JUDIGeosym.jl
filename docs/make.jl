using Documenter, JUDI

makedocs(sitename="JUDI documentation",
         doctest=false, clean=true,
         authors="Mathias Louboutin",
         pages = Any[
             "Home" => "index.md",
             "About" => "about.md",
             "Installation" => "installation.md",
             "JUDI API" => Any[
                "Abstract vectors" => "abstract_vectors.md",
                "Data Structures" => "data_structures.md",
                "Linear Operators" => "linear_operators.md",
                "Input/Output" => "io.md",
                "Helper Functions" => "helper.md"],
             "Getting Started" => "basics.md",
             "Inversion" => "inversion.md",
             "Tutorials" => map(
                s -> "tutorials/$(s)",
                sort(filter(x->endswith(x, ".md"), readdir(joinpath(@__DIR__, "src/tutorials/"))))),
              "Devito backend reference" => "pysource.md"],
         format = Documenter.HTML(
                # assets = ["assets/slim.css"],
                prettyurls = get(ENV, "CI", nothing) == "true"),
        )

deploydocs(repo="github.com/slimgroup/JUDI.jl")