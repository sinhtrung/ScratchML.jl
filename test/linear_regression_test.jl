using ScratchML, Test
using LinearAlgebra
f(x) = x #linear function for linear regression test
x = collect(0:20)
y = f(x)
β = ScratchML.fit(x,y)
@test ScratchML.loss(x,y,β) ≈ 0. atol = eps() #loss function should be 0 for an exact function
β2 = ScratchML.fit(x,y,"Ridge")
@test ScratchML.loss(x,y,β2)  ≈ 0. atol = eps() 
g(x) = -5x.+3.5 
y = g(x)
β = ScratchML.fit(x,y)
@test ScratchML.loss(x,y,β) ≈ 0. atol = eps() #loss function should be 0 for an exact function
β2 = ScratchML.fit(x,y,"Ridge")
@test ScratchML.loss(x,y,β2)  ≈ 0. atol = eps() 