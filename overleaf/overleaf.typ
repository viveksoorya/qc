#set page(
  paper: "a4",
  margin: (left: 20mm, top: 20mm), // Matching geometry package settings
  fill: black,
)

// Standard font setup (14pt as requested in documentclass)
#set text(fill: white, font: "New Computer Modern", size: 14pt)
#set par(justify: true, first-line-indent: 0pt)

// --- Definitions ---
#let ket(content) = $lr(| #content angle)$
#let bra(content) = $lr(angle #content |)$
#let braket(l, r) = $lr(angle #l | #r angle)$
#let outer(l, r) = $ket(#l) bra(#r)$
#let tr = "tr"

// Common math operators
#let comm(a, b) = $[#a, #b]$
#let acomm(a, b) = ${#a, #b}$
#let otimes = sym.times.o
#let hbar = sym.planck
#let dagger = sym.dagger

// -----------------------------------------------------------

#align(center)[
  #text(size: 1.5em, weight: "bold")[quantum computing and quantum information] \
  #v(0.5em)
  Vivek Soorya \
  July 2025
]

= sortables
Exercises 1, and 4 are too trivial; consider them solved;
Exercise 2 is solved
Exercixes 3 and 5 are incomplete

== Exercise 2.5: Inner Product on $bb(C)^n$
We need to show that $braket(phi, psi) = sum_(i=1)^n phi_i^* psi_i$ is a valid inner product on $bb(C)^n$. An inner product must satisfy three properties:
1. *Conjugate symmetry*: $braket(phi, psi) = braket(psi, phi)^*$.
2. *Linearity in the second argument*: $braket(phi, alpha psi + beta chi) = alpha braket(phi, psi) + beta braket(phi, chi)$.
3. *Positive-definiteness*: $braket(phi, phi) >= 0$, and $braket(phi, phi) = 0$ if and only if $ket(phi)$ is the zero vector.

Let $ket(phi) = vec(phi_1, dots.v, phi_n)$ and $ket(psi) = vec(psi_1, dots.v, psi_n)$.

= lemmas to prove and questions to answer
1. Show that
   a. Show that \
      $ braket(psi, M psi) = braket(psi, P_m psi) = P(m) " for " P_m $
      fixed
2. answer these
   a. What kind of transformation results when a matrix is transformed by its adjoint.
      $ mat(delim: "[", a, c; b, d) mat(delim: "[", a, b; c, d) = mat(delim: "[", a^2+c^2, a b+c d; a b+c d, b^2+d^2) $
   b. Is $ braket(psi, M psi) = ? braket(psi, P_m psi) $ \
      We know that, \
      $ braket(psi, M psi) = sum_m braket(psi, P_m psi) $
      Now, for fixed $ m equiv m_a $ every projector that is not $P_m$ will take $braket(psi, P_m psi)$ to the kernel, gives 0 as the expectation value for that projection, leaving $braket(psi, P_{m_a} psi)$ to result. Thus, for fixed $ m equiv m_a $, \
      $ braket(psi, M psi) = braket(psi, P_{m_a} psi) \ #sym.square.filled $
   c. Can a scalar have a matrix representation, can a vector have a matrix representation

= open threads in thinking
== working on these
1. Show that Given a transformation in finite dimensions from a vector space to itself, and the input basis $e_i$, the matrix columns are the output bases are the matrix columns.
2. SHow that given a matrix transformation in terms of input bases $e_i$, and output bases; the output bases become the matrix's columns. How can I systematically explore the prove for this
3. A + B + C = inner product where
   - A: $ braket(v_1, v_2) = braket(v_2, v_1)^* $
   - B: $ braket(v_1, v_1) >= 0 $ and is equal to 0 iff $ v_1 = 0 $
   - B: projection of a vector with itself are always positive complex values.
   - C: $ braket(v_1, lambda v_2) = lambda braket(v_1, v_2) = $ linearity

== attempted these
1. Is the outer product like a projection onto the vector space itself, with the vector that outer product vector being a sort of light source and the vector being operated on being the object & the resultant vector being the projection? It is essentially an additional left multiplication with the dual.
2. For quantum mechanics, we only need the vector space made of vectors whose norm is $<= 1$. Can we discard the rest of the vector space? (i.e. where the norm is $> 1$)
3. Given an isolated physical system, what is the state space?
4. Is negative like eigenvalue interpreted as phase?
5. What is a determinant, physically? Cuz they are used in characteristic equation to extract eigenvalues and eigenvectors

== Proof cycle and related stuff

How do I prove this? How do I approach thinking about this in terms of proof; How do I go from this conjecture to thinking; we need to start from things we know to be true and arrive here; this method is known as direct proof; there are other methods too, but a proof generally needs an idea;

1. Understand every term of the proof at a cursory level.
2. Understand what is being asked in those terms?
3. Now you understand the task at this point.
4. Ideate and attempt; sketch out promising avenues that look hopeful.
5. Once you have a promising sketch, write it in better detail.
6. Cycle until you reach a satisfactory proof.
7. Write down ideas while Ideating. Think on paper.

== unitary operator
1. Unitary transformation depends only on initial and final state.
2. why does it not depend on the intermediary at time stamps or states? How do we know that it doesn't? Is it odd that it doesn't?
3. Does the unitary operator depend on the initial timestamp or does it depend on the initial state vector and the final state vector?
4. How to find all unitary operators of a given dimension.

= recurrables
== Pauli Gates


Quantum gates are simply operators. But since we are doing quantum computation, we adapt the term gate instead of operators.
$
I = mat(delim: "[", 1, 0; 0, 1) quad
X = mat(delim: "[", 0, 1; 1, 0) quad
Y = mat(delim: "[", 0, -i; i, 0) quad
Z = mat(delim: "[", 1, 0; 0, -1)
$
#align(center)[
  #table(
    columns: 4,
    stroke: none,
    align: center,
    [I], [X], [Y], [Z],
    [], [bit flip], [], [phase flip],
    [], [quantum not], [], []
  )
]

=== Pauli gates on $e_i$
$
I ket(0) &= ket(0) \
I ket(1) &= ket(1) \
X ket(0) &= ket(1) \
X ket(1) &= ket(0) \
Y ket(0) &= -i ket(1) \
Y ket(1) &= i ket(0) \
Z ket(0) &= ket(0) \
Z ket(1) &= -ket(1) \
$

== More Notes
1. A coordinate transformation is a linear operation.
2. That a matrix can be composed of output bases is a property of input bases $e_i$, and that the requires input bases $e_i$ and the transformation to be into the same vector space.
3. In matrix multiplication, the number of columns out of the left matrix and the number of rows in the right matrix have to be equal.
   - The number of columns of the right matrix gives the number of columns of the resultant matrix.
4. 'unitary transformation' of a "state vector" can be physically interpreted as the 'time evolution' of "an isolated quantum mechanical system":
5. Unitary transformation
   a. Reversible transformation
   b. inverse is adjoint
6. Reversible operations are the only operations we concern ourselves with so far as quantum computation and quantum information is concerned
7. unitary operations are the only operations possible for evolution.
8. We will deal with only finite-dimensional Hilbert space.
9. projection of a vector on another vector can be obtained by an inner product.
10. linear means matrix (scalar (vector)) = scalar (matrix (vector))
11. inner product needs linearity

1. Unitary evolution is essentially basis change. When not measured, the quantum system changes its basis continuously. When measured, the quantum system fixes its basis.

2. After measurement, the quantum system continues to exist in the new basis, but since we are not measuring it anymore, shouldn't it keep changing its basis;

3. It feels like the Evolution postulate is contending with the Measurement postulate. Contradiction arises from the faulty assumption that the all unitary transformations are merely basis changes.

4. Odd sized matrices cannot exist in quantum computation, since operators are acting on vectors of size $2^n$. Moreover, the size of the operator is also $2^n times 2^n$.

5. Are the Pauli matrices the only Hermitian matrices that are also unitary?

= solved problems
== Exercise 2.1: Linear dependence
We are asked to consider the linear independence of the vectors
$ vec(-1, 1), vec(1, 2), vec(2, 1) $
In a 2-dimensional space ($bb(R)^2$), any set of three or more vectors is linearly dependent. Therefore, this set of four vectors is linearly dependent.
As a proof by example, we can show one vector can be written as a linear combination of others. For instance:
$ vec(-1, 1) = alpha vec(1, 2) + beta vec(2, 1) $
This gives us a system of two equations:
$ -1 &= alpha + 2beta \ 1 &= 2alpha + beta $
Solving this system, we find $alpha = 1$ and $beta = -1$.
$ vec(-1, 1) = (1) vec(1, 2) + (-1) vec(2, 1)
#sym.square.filled $

== Exercise 2.2: Matrix Representation of an Operator
$A: V_0 arrow V_0$ be a linear operator on the vector space spanned by the basis vectors $ket(0)$ and $ket(1)$. The action of the operator is given by:
$ A ket(0) = ket(1) quad "and" quad A ket(1) = ket(0) $
matrix representation of $A$ in the basis ${ket(0), ket(1)}$ is found by determining how $A$ acts on each basis vector. Let the matrix be $A = mat(a, b; c, d)$.
- $A ket(0) = A vec(1, 0) = vec(a, c) = vec(0, 1) => a=0, c=1$.
- $A ket(1) = A vec(0, 1) = vec(b, d) = vec(1, 0) => b=1, d=0$.
Thus, the matrix representation of $A$ is:
$ A = mat(0, 1; 1, 0) $
This matrix is known as the Pauli-X matrix, often denoted by $sigma_x$.

=== Exercise 2.2, rabbithole: Change of Basis
We have the same operator $A$ (the Pauli-X matrix), but we want to find a new output basis such that its matrix representation is diagonal, specifically:
$ A' = mat(1, 0; 0, -1) $
This new basis, the eigenbasis of $A$, is composed of the eigenvectors of $A$. We can find them by solving the eigenvalue equation $A ket(v) = lambda ket(v)$.
$ mat(0, 1; 1, 0) vec(a, b) = lambda vec(a, b) $
The characteristic equation is $det(A - lambda I) = 0$:
$ det mat(-lambda, 1; 1, -lambda) = lambda^2 - 1 = 0 => lambda = plus.minus 1 $
The eigenvalues are $lambda_1 = 1$ and $lambda_2 = -1$.
- For $lambda_1 = 1$:
  $ mat(-1, 1; 1, -1) vec(a, b) = vec(0, 0) => -a+b=0 => b=a $
  The normalized eigenvector is $ket(v_1) = 1/sqrt(2) vec(1, 1) = 1/sqrt(2) (ket(0) + ket(1))$.
- For $lambda_2 = -1$:
  $ mat(1, 1; 1, 1) vec(a, b) = vec(0, 0) => a+b=0 => b=-a $
  The normalized eigenvector is $ket(v_2) = 1/sqrt(2) vec(1, -1) = 1/sqrt(2) (ket(0) - ket(1))$.



The new output basis is the set of eigenvectors ${ket(v_1), ket(v_2)}$. The action of $A$ on these basis vectors is:
$ A ket(v_1) = 1 ket(v_1) quad "and" quad A ket(v_2) = -1 ket(v_2) $
In this new basis, the matrix representation of $A$ is indeed $ mat(1, 0; 0, -1)$.

