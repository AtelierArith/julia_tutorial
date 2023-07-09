using Remark

for d in
    ["getting_started", "tutorial_part1", "why_i_use_julia", "software_development", "pluto"]
    Remark.slideshow(
        joinpath(@__DIR__, d);
        options=Dict("ratio" => "16:9"), title="Presentation",
    )
end
