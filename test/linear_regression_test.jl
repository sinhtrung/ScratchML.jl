using ScratchML, Test
f(x) = x #linear function for linear regression test
x = collect(0:20)
z = f(x)
β = ScratchML.fit(x,z)
ẑ = β*x
@test ScratchML.loss(ẑ,z) == 0.0 #loss function should be 0 for an exact function

g(x) = -5x +3.5
x = collect(0:20)
z = f(x)
β = ScratchML.fit(x,z)
ẑ = β*x
@test ScratchML.loss(ẑ,z) == 0.0 #loss function should be 0 for an exact function