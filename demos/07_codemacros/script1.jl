using Replay

instructions = [
    "include(\"mylib.jl\");",
    "x = rand()",
    "@code_lowered relu1(x)",
    "@code_lowered relu2(x)",
    "@code_lowered relu3(x)",
    "@code_typed relu2(x)",
    "@code_typed relu3(x)",
    "@code_llvm debuginfo=:none relu2(x)",
    "@code_llvm debuginfo=:none relu3(x)",
    "@code_native debuginfo=:none relu2(x)",
    "@code_native debuginfo=:none relu3(x)",
]

replay(instructions, use_ghostwriter=true)
