using Replay

instructions = [
    "using OhMyREPL",
    "using Dates",
    """
    function update_main(fname::AbstractString)
        dt = Dates.format(now(), "HH:MM:SS")
        open(fname,"w") do f
            code = \"\"\"
            function main()
                msg = "このコードは" * "\$(dt)" * "に更新されました"
            end
            \"\"\"
            write(f, code)
        end
    end
    """,
    "using Revise",
    "# 中身を確認します",
    "run(`cat mylib.jl`)",
    "# mylib.jl の変更を監視します", 
    "includet(\"mylib.jl\")",
    "# mylib.jl の中身を確認します", 
    "run(`cat mylib.jl`)",
    "main()",
    "sleep(3)",
    "# mylib.jl を更新します",
    "update_main(\"mylib.jl\")",
    "run(`cat mylib.jl`)",
    "# 最初の main() の結果と比較せよ",
    "main()",
    """
    function reset_main(fname::AbstractString)
        open(fname,"w") do f
            code = \"\"\"
            function main()
                msg = "初期状態"
            end
            \"\"\"
            write(f, code)
        end
    end
    """,
    "# mylib.jl をリセットします", 
    "reset_main(\"mylib.jl\")",
    "run(`cat mylib.jl`)",
]

replay(instructions, julia_project=@__DIR__, use_ghostwriter=false)
