using Replay

instructions = [
    "using Debugger",
    """include("mylib.jl")""",
    "@enter main()",
    "si",
    "n",
    "n",
    "n",
    "w add s",
    "w",
    "n",
    "n",
    "n",
    "n",
    "n",
    "n",
    "w",
    "so",
    "q",
]

replay(instructions)
