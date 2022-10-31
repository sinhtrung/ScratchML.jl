#=
    Implementation of the linear regression formula and estimates for
    the β parameter
=#
hcat_feature_one(x) = hcat(ones(size(x)),x) #add ones to features to get β0

function fit(x,y,regression = "Linear", λ = 0)
    X=hcat_feature_one(x)
    if regression == "Linear"
        A = X'*X
        b = X'*y
        prob = LinearProblem(A,b)
        sol = solve(prob)
        return sol.u #inv(X'*X)*X'*y
    elseif regression == "Ridge"
        Î = Diagonal(vcat([0],ones(size(x,2)))) #make diagonal identity array except at first diagonal
        A = X'*X-λ*Î
        b = X'*y
        prob = LinearProblem(A,b)
        sol = solve(prob)
        return sol.u #inv(X'*X-λ*Î)*X'*y
    end
end 

function loss(x,y,β,regression = "Linear", λ = 0)
    X=hcat_feature_one(x)
    if regression == "Linear"
        return 0.5(y-X*β)'*(y-X*β)
    elseif regression == "Ridge"
        return 0.5(y-X*β)'*(y-X*β)+0.5λ*sum(β[2:end]^.2)
    end
end 