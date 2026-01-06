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

= lemmas to prove and questions to answer
1. Show that
   a. Show that $forall U. exists H. U = e^(i H)$ #text(fill: luma(90%))[where U: unitary, H: Hermitian operator] What would I need for this;
   b. Show how $e^(i theta) approx (-1)^n$; assuming $e^(i theta) = cos theta + i sin theta$, and $theta = pi$, we get $e^(i theta) = -1$; *what is n here?*
   c. Show that \ $bra(psi) M ket(psi) = bra(psi) P_m ket(psi) = P(m) " for " P_m$ fixed.
   d. Show that all matrices/transformations in a Complex-valued Vector Space have at least one eigenvector.
   e. Show that all full rank matrices in a Complex-valued Vector Space have n eigenvalues, where n is the dimension of the vector space; It appears then that full-rank non-rotating matrices have all have n eigenvalues. Show the latter first; Prove or disprove the former;
   f. Show that all transformation whether they are rotating transformations or not, have at least one complex eigenvalue; Show this especially for rotating transformation;
   g. (Duplicate in source) Show that all transformation whether they are rotating transformations or not, have at least one complex eigenvalue; Show this especially for rotating transformation;
   h. Show that when a transformation is scaled so do its eigenvalues (and by the same scalar value).
   i. Show that when you scale a matrix, so does its determinant by the scalar raised to n, the dimension of the vector space.
   j. Show that a transformation into the same vector space is fixed as matrix composed of output bases given the input bases are bases $e_i$ and that the vector space is finite dimensional.
   k. Show that Given a transformation in finite dimensions from a vector space to itself, and the input basis $e_i$, the matrix columns are the output bases are the matrix columns. How can I systematically explore the prove for this.
   l. *Exercise 2.5: Inner Product on $bb(C)^n$* \ We need to show that $braket(phi, psi) = sum_(i=1)^n phi_i^* psi_i$ is a valid inner product on $bb(C)^n$. An inner product must satisfy three properties:
      1. *Conjugate symmetry*: $braket(phi, psi) = braket(psi, phi)^*$.
      2. *Linearity in the second argument*: $braket(phi, alpha psi + beta chi) = alpha braket(phi, psi) + beta braket(phi, chi)$.
      3. *Positive-definiteness*: $braket(phi, phi) >= 0$, and $braket(phi, phi) = 0$ if and only if $ket(phi)$ is the zero vector.
      Let $ket(phi) = vec(phi_1, dots.v, phi_n)$ and $ket(psi) = vec(psi_1, dots.v, psi_n)$.

2. answer these
   a. Is H decomposable into Pauli matrices X and Z.
   b. How do you mathematically represent an overall global phase shift.
   c. Why are the eigenstates of the Hamiltonian operator $1/2 (ket(0) + ket(1))$, and $1/2 (ket(0) - ket(1))$; Why are the eigenvalues of the Hamiltonian operator $hbar omega$ and $-hbar omega$.
   d. If you raise $e^(i theta)$ to iota times any given hermitian transformation, will you always get a unitary transformation.
   e. Do eigenstates always have to presented normalized; or does it not matter, since "eigen-ness" of things is really in the direction.
   f. A given observable has a collection of measurement operators; Is the cardinality of this set upper bound by the dimension of the vector space.
   g. Why are there a set of measurement operators, and not just one operator for an observable with the eigenvalues of the same corresponding to the measures; what does it mean to have multiple operators for the same observable.
   h. What is completeness; a full rank matrix is said to be complete; what is the completeness equation or relation;
   i. Does the unitary operator depend on the initial timestamp and the final timestamp or does it depend on the initial state vector and the final state vector.
   j. What is the geometric interpretation of outer product.
   k. Why is spectral decomposition called so? Does it mean composed of sum of self outer products of eigenvectors scaled by eigenvalues? Yes but this needs a better way of putting it; spectral decomposition is related to the spectrum of the matrix; what is the spectrum of a matrix;
   l. Energy eigen states Why are they called stationary states?
   m. Are function spaces, spaces where each vector's components are functions? or is it that a vector in a function space is a function?
   n. If eigenvalues can represent the different values of energy the state can be measured to have at any instant on measuring, what do eigenstates represent/signify?
   o. How can there be a bijective from discrete-time dynamics (unitary operators), and continuous time dynamics of Hamiltonians. There isn't? states are discrete, evolution can happen continuously?
   p. There are two formulations of dynamics here: operators with discrete time dynamics & that makes use of operators & vectors.
   q. continuous time dynamics that makes use of function spaces & then & Hamiltonians. Ex: Energy is continuous classically, but discrete quantum mechanically.
   r. Are vectors and wavefunctions equivalent representations of a closed quantum state? No? Just used for different properties?
   s. How does the Hamiltonian of the system describe its dynamics?
   t. Can we really just use any matrix as a Hamiltonian, in other words, do all matrices function as a Hamiltonian for some closed quantum mechanical system?
   u. The derivative of the state vector is the Hamiltonian of the state vector, apart a scaling factor. No? The Hamiltonian of the state vector function together? its derivative, apart a scaling factor apart. An imaginary scaling factor apart.
   v. Why is the probability of getting m on measuring $$bra(psi) M_m^dagger M_m ket(psi)?$$ (Here, the vector could be measured by any matrix $M_m. m in {...}$); Projection of the measured state on itself.
   w. Projection of a vector on itself gives you the magnitude of the vector.
   x. Do X and Z form a basis. In other words, are they linearly independent matrices?
   y. What kind of transformation results when a matrix is transformed by its adjoint.
      $ mat(a, c; b, d) mat(a, b; c, d) = mat(a^2+c^2, a b+c d; a b+c d, b^2+d^2) $
   z. Can a scalar have a matrix representation, can a vector have a matrix representation.
   (aa) Is the outer product like a projection onto the vector space itself, with the vector that outer product vector being a sort of light source and the vector being operated on being the object & the resultant vector being the projection? It is essentially an additional left multiplication with the dual.
   (ab) For quantum mechanics, we only need the vector space made of vectors whose norm is $<= 1$. Can we discard the rest of the vector space? (i.e. where the norm is $> 1$).
   (ac) Given an isolated physical system, what is the state space?
   (ad) Is negative like eigenvalue interpreted as phase?
   (ae) What is a determinant, physically? Cuz they are used in characteristic equation to extract eigenvalues and eigenvectors.
   (af) Derive the expectation values of a measurement operator.
   (ag) 

= verify these

Is the following statement true? \
$ bra(psi) M ket(psi) = ? bra(psi) P_m ket(psi) $
We know that, \
$ bra(psi) M ket(psi) = sum_m bra(psi) P_m ket(psi) $
Now, for fixed $ m equiv m_a $ every projector that is not $P_m$ will take $bra(psi) P_m ket(psi)$ to the kernel, gives 0 as the expectation value for that projection, leaving $bra(psi) P_{m_a} ket(psi)$ to result.
Thus, for fixed $ m equiv m_a $, \
$ bra(psi) M ket(psi) = bra(psi) P_{m_a} ket(psi) \ #sym.square.filled $

= queries
$ integral delta(x, x_0) d x = 1 $

1. Time and energy have an uncertainty relation? This informs "why does knowing Hamiltonian tell us everything about dynamics of the system."
2. spectral decomposition
3. spectral measure
4. How does knowing energy (Hamiltonian) alone tell us the dynamics of the system?
5. Why are energy eigenstates referred to as stationary states?
6. What is the significance of the time evolution operator in quantum mechanics?
7. How does energy generate time?

= never gonna practice

== working on these
1. A + B + C = inner product where
   - A: $ braket(v_1, v_2) = braket(v_2, v_1)^* $
   - B: $ braket(v_1, v_1) >= 0 $ and is equal to 0 iff $ v_1 = 0 $
   - B: projection of a vector with itself are always positive complex values.
   - C: $ braket(v_1, lambda v_2) = lambda braket(v_1, v_2) = $ linearity
2. What happens if the inner product rule does not hold; why is inner product defined to have that rule
3. What situations compel one to put in the positive definiteness rule of inner product;
