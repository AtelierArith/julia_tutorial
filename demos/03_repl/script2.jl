using Replay

instructions = [
    "# Julian Mode",
    "println(\"Hi\")",
    "using Pkg",
    """Pkg.add("Example")""",
    "using Example",
    """Example.hello("World")""",
    """hello("World")""",
    "# Pkg REPL",
    "# Enter ]",
    "] add Example",
    CTRL_C,
    "# Help Mode",
    "# Enter ?",
    "?α",
    "?ℚ",
    "?π",
    "?🍌",
    "# Shell Mode",
    "# Enter ;",
    ";",
    "echo Hello World",
    "date",
    CTRL_C,
    "# Bye",
]

replay(instructions, use_ghostwriter=true)
