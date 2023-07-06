using Random

"""
	relu1(x)

ReLU (rectified linear unit) activation function
"""
function relu1(x)
    if x > 0
        return x
    else
        return 0
    end
end

"""
	relu2(x)

relu1 と同じ
"""
relu2(x) = x > 0 ? x : 0

"""
	relu3(x)

型安定な実装. relu3("myname") という使い方を許してしまう
"""
relu3(x) = x > 0 ? x : zero(x)

"""
	relu4(x::Real)

入力を実数の範囲に抑える. Real の派生型 T <: Real の値を受け付ける
"""
relu4(x::Real) = x > 0 ? x : zero(x)

"""
	relu5(x::T) where {T<:Real}

zero(T) は 型 T としてのゼロを返す
"""
function relu5(x::T) where {T<:Real}
    x > 0 ? x : zero(T)
end

function main1(N=10)
    rng = MersenneTwister(0)
    s = 0.0
    for y in [relu1(2rand(rng) - 1) for _ in 1:N]
        # s = s + y
        s += y
    end
    s
end

function main3(N=10)
    rng = MersenneTwister(0)
    s = 0.0
    for y in [relu3(2rand(rng) - 1) for _ in 1:N]
        # s = s + y
        s += y
    end
    s
end

"""
    sumevens(N::Integer)

1 から N までの範囲の偶数を収集する. 収集した値を全て足し，その値を返却する.
"""
function sumevens(N::Integer)
    N ≥ 1 || throw(DomainError(N, "`N` cannot be less than 1."))
    arr = []
    for n in 1:N
        if iseven(n)
            push!(arr, n)
        end
    end
    return sum(arr)
end

