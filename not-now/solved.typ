#set page(
  paper: "a4",
  margin: 1in,
  fill: black,
)

// Standard font setup
#set text(fill: white, font: "New Computer Modern", size: 10pt)
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

= Solved Math Problems

= solved problems
== problems designed by yours truly
+ Show that Hermitian operators are normal operators;
  What is a normal operator; an operator A for which $A A^dagger = A^dagger A$;
  What is a hermitian operator: an operator B for which $B = B^dagger$;
  Let’s take a fixed, arbitrary operator $B_f$ for which $B_f = B_f^dagger$, and show that $B_f B_f^dagger = B_f^dagger B_f$;
  $ B_f B_f^dagger = B_f B_f = B_f^dagger B_f #sym.square.filled $

== exercises
=== Exercise 2.1: Linear dependence
We are asked to consider the linear independence of the vectors
$ vec(-1, 1), vec(1, 2), vec(2, 1) $
In a 2-dimensional space ($bb(R)^2$), any set of three or more vectors is linearly dependent.
Therefore, this set of four vectors is linearly dependent.

As a proof by example, we can show one vector can be written as a linear combination of others.
For instance:
$ vec(-1, 1) = alpha vec(1, 2) + beta vec(2, 1) $
This gives us a system of two equations:
$ -1 &= alpha + 2beta \ 1 &= 2alpha + beta $
Solving this system, we find $alpha = 1$ and $beta = -1$.
$ vec(-1, 1) = (1) vec(1, 2) + (-1) vec(2, 1) #sym.square.filled $

=== Exercise 2.2: Matrix Representation of an Operator
Let $A: V_0 arrow V_0$ be a linear operator on the vector space spanned by the basis vectors $ket(0)$ and $ket(1)$.
The action of the operator is given by:
$ A ket(0) = ket(1) quad "and" quad A ket(1) = ket(0) $
The matrix representation of $A$ in the basis ${ket(0), ket(1)}$ is found by determining how $A$ acts on each basis vector.
Let the matrix be $A = mat(a, b; c, d)$.
- $A ket(0) = A vec(1, 0) = vec(a, c) = vec(0, 1) => a=0, c=1$.
- $A ket(1) = A vec(0, 1) = vec(b, d) = vec(1, 0) => b=1, d=0$.

Thus, the matrix representation of $A$ is:
$ A = mat(0, 1; 1, 0) $
This matrix is known as the Pauli-X matrix, often denoted by $sigma_x$.
Show that all transformation whether they are rotating transformations or not, have at least one complex eigenvalue;
Show this especially for rotating transformation;

Since virtually any input and output bases except precisely those pair of bases that are resultant from applying the exact same transformation to both the vector base input & output bases, could give rise to a different matrix representation of A, I leave the problem here to be trivially solvable.
Say you can take ${ket(0), ket(1)}$ as input basis & ${ (ket(0)+ket(1))/sqrt(2), (ket(0)-ket(1))/sqrt(2) }$ as output basis & you would get a different representation.
Well, even if you take same input basis & change only one of the output basis vectors, you would still get a different matrix representation of A.

==== Exercise 2.2, rabbithole: Change of Basis
We have the same operator $A$ (the Pauli-X matrix), but we want to find a new output basis such that its matrix representation is diagonal, specifically:
$ A' = mat(1, 0; 0, -1) $
This new basis, the eigenbasis of $A$, is composed of the eigenvectors of $A$.
We can find them by solving the eigenvalue equation $A ket(v) = lambda ket(v)$.
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

The new output basis is the set of eigenvectors ${ket(v_1), ket(v_2)}$.
The action of $A$ on these basis vectors is:
$ A ket(v_1) = 1 ket(v_1) quad "and" quad A ket(v_2) = -1 ket(v_2) $
In this new basis, the matrix representation of $A$ is indeed $ mat(1, 0; 0, -1) $.
