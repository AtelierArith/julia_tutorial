using Replay

instructions = [
    "include(\"mylib.jl\");",
    "using BenchmarkTools",
    "N = 100000",
    "@benchmark main1(\$N)",
    "@benchmark main3(\$N)",
]

replay(instructions, use_ghostwriter=true)
