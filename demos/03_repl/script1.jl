using Replay

instructions = [
    """\"\"\"
    The tab key can also be used to substitute
    LaTeX math symbols with their Unicode equivalents, 
    and get a list of LaTeX matches as well:
    \"\"\";
    """,
    "# Example:",
    "# \\sigma\\<TAB> で σ が出るよ.",
    "# <TAB> はタブキーを入力すると解釈してね",
    "# \\sigma<TAB>\\_i<TAB>\\^(j-1)<TAB> = 1 で",
    "# σᵢ⁽ʲ⁻¹⁾ = 1 が出るよ",
    "\\sigma$(TAB)\\_i$(TAB)\\^(j-1)$(TAB) = 1",
    "# :banana:<TAB> で 🍌 だよ!",
    "\\:banan$(TAB)$(TAB)",
    "# そんなバナナ〜",
    "# ん？"
]

replay(instructions, use_ghostwriter=true)
