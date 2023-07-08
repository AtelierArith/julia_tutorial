#=
MIT License
Copyright (c) 2022 Satoshi Terasaki <terasakisatoshi.math@gmail.com> and contributors
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
=#

# Play Tic-Tac-Toe
using Term: tprintln
using Term: @red, @yellow, @blue, @green
using Term: Panel

function flipmark(mark)
    if mark == "○"
        return "×"
    end
    if mark == "×"
        return "○"
    end
    error(ArgumentError("Invalid value mark: $mark"))
end

# display game logo
Panel(
    "{red}Play Tic-Tac-Toe{/red}",
    title = "Term's",
    title_style = "bold green",
    style = "gold1 bold",
    subtitle = "Panels",
    subtitle_style = "bold blue",
    subtitle_justify = :center,
    fit = true,
    justify = :center,
) |> println

isfilled = Bool[
    false false false
    false false false
    false false false
]

table = Panel[
    Panel(" ", fit = true) Panel(" ", fit = true) Panel(" ", fit = true)
    Panel(" ", fit = true) Panel(" ", fit = true) Panel(" ", fit = true)
    Panel(" ", fit = true) Panel(" ", fit = true) Panel(" ", fit = true)
]

table_str = String[
    "" "" ""
    "" "" ""
    "" "" ""
]

function ask_who_wins()
    global table_str
    for mark in ["○", "×"]
        any([
            # row
            all(table_str[1, :] .== mark),
            all(table_str[2, :] .== mark),
            all(table_str[3, :] .== mark),
            # col
            all(table_str[:, 1] .== mark),
            all(table_str[:, 2] .== mark),
            all(table_str[:, 3] .== mark),
            # diag
            table_str[1, 1] == table_str[2, 2] == table_str[3, 3] == mark,
            table_str[3, 1] == table_str[2, 2] == table_str[1, 3] == mark,
        ]) && return mark
    end
    return ""
end

# display init status
Panel(
    prod(table[1, :]) / prod(table[2, :]) / prod(table[3, :]),
    title = "Current status",
    fit = true,
) |> println

mark = "○"

while true
    global table, table_str, isfilled, mark

    candr, candc = rand(findall((.!)(isfilled))).I
    println("Player $(mark)'s turn.")
    print("Please input <row>x<col> e.g. $(candr)x$(candc). ")
    tprintln("Press {green}q{/green} to quit.")
    s = readline()

    # correct me if I'm wrong
    m = match(r"^[123]{1}x[123]{1}$", s)

    if isnothing(m)
        if s == "q"
            println(@blue("Exit Game..."))
            break
        end
        println(@red("Invalid input \"$s\". "))
        continue
    end
    r, c = parse.(Int, split(s, "x"))
    if isfilled[r, c]
        println(@red("You can't insert here $(r)x$(c). It is not empty."))
        candr, candc = rand(findall((.!)(isfilled))).I
        continue
    else
        table[r, c] = Panel(mark, fit = true)
        table_str[r, c] = mark
        isfilled[r, c] = true
    end

    # display init status
    Panel(
        prod(table[1, :]) / prod(table[2, :]) / prod(table[3, :]),
        title = "Current status",
        fit = true,
    ) |> println

    p = ask_who_wins()
    if isempty(p)
        # It's not settled
        mark = flipmark(mark)
        if all(isfilled)
            println(@green("Draw (´・∀・｀)"))
            break
        end
        continue
    else
        println("Congrats! $(p) wins!")
        println(@blue("Exit Game..."))
        break
    end
end
