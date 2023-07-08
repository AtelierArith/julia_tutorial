using Replay

instructions = [
	"include(\"app.jl\")",
	"1x1",
	"1x3",
	"1x2",
	"2x1",
	"2x3",
	"2x2",
	"3x1",
	"3x2",
	"3x3",
]

replay(instructions, use_ghostwriter=true)