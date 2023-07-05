using Replay

instructions = [
    """println("Hello")""",
]

replay(instructions, use_ghostwriter=true)
