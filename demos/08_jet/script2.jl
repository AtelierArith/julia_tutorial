using Replay

instructions = [
    "using JET",
    "include(\"mylib.jl\");",
    "# 型不安定", 
    "report_opt(main1, (Int,))",
    "@report_opt main1(10)",
    "# 型安定", 
    "report_opt(main3, (Int,))",
    "@report_opt main3(10)",
]

replay(instructions, use_ghostwriter=true)
