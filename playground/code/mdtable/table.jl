using Markdown
using Term

const url = "https://raw.githubusercontent.com/akio-tomiya/julia_imi_workshop2023/main/index.md"
const md = Markdown.parse_file(Base.download(url))

function query2md(query::String)
    header3s = filter(md.content) do c
        c isa Markdown.Header{3}
    end
    h3 = filter(header3s) do h3
        occursin(query, h3.text[begin])
    end |> first
    idx = findfirst(c -> c == h3, md.content)
    Markdown.MD(md.content[idx+1])
end

function id2md(session_id::Int)
    # 0 の場合はチュートリアル講演を表示
    session_id == 0 && (return query2md("チュートリアル講演"))
    # 各分野の講演者の情報を表示
    (1 ≤ session_id ≤ 6) && (return query2md("$(session_id)　講演"))
    # それ以外のケースではタイムテーブルを表示するロジックにフォールバックさせる
    table = filter(md.content) do c
                c isa Markdown.Table
            end |> first |> Markdown.MD |> Term.parse_md
    table
end

if abspath(PROGRAM_FILE) == @__FILE__
    session_id = isempty(ARGS) ? -1 : parse(Int, ARGS[begin])
    println(id2md(session_id))
end
