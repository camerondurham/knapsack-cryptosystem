# Base Field

B.<a> = GF(5, modulus="random")
B.modulus()
# B.multiplicative_generator()  # generator is alpha = 2

alpha = 2


# Knapsack Field

p = 5
h = 3
q = 125

# irreducible polynomial in GF(125)
f = x^3 + 3 * x + 2

# finding a random generator from the
R = PolynomialRing(GF(125), 'x')
x = R.gen()
S = R.quotient(f, 'a')
a = S.gen()

# let g be a power of the generator of GF(125)
# this will also yield a generator of the field

# 69 was the randomly chosen element that's a generator
g = a ^ 69
# Let g be the new generator

# define the knapsack field
K.<a> = GF(5 ^ 3, modulus=f)


A =  [9, 59, 79, 2, 58]
d = 86

prm = {0: 1, 1: 0, 2: 3, 3: 2, 4: 4}


C = [mod(A[prm[j]] + d, q - 1) for j in range(len(A))]

Public_key = [C, p, h]

private_key = [f, g, prm, d]


# obtain A's public key

Pk = Public_key
p = Pk[1]
h = Pk[2]
C = Pk[0]

#len = floor(  log_b(binomial(p,h),2) );

# Message
M = [1, 0, 1, 1, 0]  # message is 22

# initialize ciphertext sum c
c = 0

for ii in range(0, p - 1):
    c = c + mod(M[ii] * C[ii], q - 1)

# ciphertext is c =

# print log table
for j in range(1, p ^ h):
    print("$g^{"+ str(j) + "}$" + ","+ "$"+str(g ^ j) + "$")


# Decryption

r = mod(c - h * d, p ^ h - 1)

# g is defined in GF(125) modulo f(x) as the system requires
u = g ^ r

s = x^2 + 3*x + 4 + x^3 + 3*x + 2
