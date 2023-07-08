using ProfileSVG

include("mylib.jl")

N = 100000
# 型不安定な実装
main1(N)
# 型安定な実装
main3(N)

ProfileSVG.@profview begin
    for _ in 1:100
        main1(N)
    end
end
ProfileSVG.save("main1.svg")
ProfileSVG.@profview begin
    for _ in 1:100
        main3(N)
    end
end
ProfileSVG.save("main3.svg")
