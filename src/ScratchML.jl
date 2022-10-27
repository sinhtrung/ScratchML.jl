module ScratchML
export fit,loss
#=
fit(X,y) = inv(transpose(X)*X)*transpose(X)*y
loss(ŷ,y) = 0.5*transpose(y-ŷ)*(y-ŷ)
=#
fit(X,y) = inv(X'*X)*X'*y
loss(ŷ,y) = 0.5*(y-ŷ)'*(y-ŷ)
end

#=
    Implementation of the linear regression formula and estimates for
    the β parameter
=#
