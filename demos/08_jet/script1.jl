using Replay

instructions = [
    "using JET",
    "include(\"mylib.jl\")",
    "report_call(sumevens, (Int,))",
    "@report_call sumevens(10)",
]

replay(instructions, use_ghostwriter=true)
