using Replay

instructions = """
using FileIO, Sixel, Plots
gr()
buf = IOBuffer()
show(buf, MIME("image/png"), plot(sin, size=(500, 300)))
buf |> load |> sixel_encode
"""

replay(instructions)