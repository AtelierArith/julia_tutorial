import Pkg;
Pkg.instantiate();
using NodeJS
run(`$(npm_cmd()) install highlight.js purgecss`)
import PkgPage
prepath = (get(ENV, "CI", "false") == "true") ? "julia_tutorial" : ""
PkgPage.optimize(input="page", prepath=prepath, clear=true)
