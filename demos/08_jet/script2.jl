using Replay

instructions = [
    "using JET",
    "include(\"mylib.jl\");",
    "# 型不安定",
    "code_warntype(main1, (Int,))",
    "# 型安定",
    "code_warntype(main3, (Int,))",
]

replay(instructions, use_ghostwriter=true)
