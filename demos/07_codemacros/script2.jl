using Replay

instructions = [
    "include(\"mylib.jl\");",
    "@code_warntype main1(10)",
    "@code_warntype main3(10)",
]

replay(instructions, use_ghostwriter=true)
