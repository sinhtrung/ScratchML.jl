#=
    Implementation of the linear regression formula and estimates for
    the β parameter
=#


function fit(X,y,regression = "Linear", λ = 0)
    if regression == "Linear"
        return inv(X'*X)*X'*y
    end
end 

function loss(ŷ,y,regression = "Linear", λ = 0)
    if regression == "Linear"
        return 0.5*(y-ŷ)'*(y-ŷ)
    end
end 