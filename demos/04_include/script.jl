using Replay

instructions = [
    """include("mylib.jl")""",
    "main()",
]

replay(instructions, use_ghostwriter=true)
