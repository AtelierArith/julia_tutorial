function gauss(N=100)
    s = 0
    for n in 1:N
        s += n
    end
    s
end

function main()
    N = 100
    gauss(N)
end
