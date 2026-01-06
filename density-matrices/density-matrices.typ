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

// --- User Requested Corrections ---
#let otimes = sym.times.o
#let hbar = sym.planck
#let dagger = sym.dagger

// -----------------------------------------------------------

= inquiry

1. Density matrices are a way to represent states. A density matrix is used to represent mixed states ie if you dont know the state of a system but you know that it is one among a bunch of states, you can weight the projectors of each state and sum them up to get their corresponding [probability] density matrix. This raises a few questions:
  1. why projectors
  2. why sum the scaled projectors, especially given that there are infinite combinations of terms that lead to the same sum.
  3. why scale them probabilities. Firstly note that the entries in projector are products of amplitudes. Then, at least the diagonal entries are probabilities. #footnote[The off diagonal entries are coherence terms, why?] scaling them is like multiplying probabilities, which makes sense since the probability of measuring a basis vector is now given by the probability of the superposition in question being the actual superposition, times the probability that within the superposition the chosen basis state is measured.

2. The density matrix of a pure state with probability 1 is just the projector of that state. The entries in the projectors of such states get us information about the probability of that basis state occuring; this interpretation works for the diagonal elements, but what about the off diagonal elements which are coefficients of outer product of orthogonal basis states?

3. Why sum the projectors? because it is a linear combination? why? because they are all the different possibilities? Then how is the linearity in the superposition of a pure state distinct from the linearity in the different pure states of a mixed state?

4. Why is the first bell state so peculiar? Why is the whole system in a pure state but the subsystems in mixed states. Is the mixedness then a resource, an inalienable part of entanglement? Is it that we may choose where the mixedness will appear in the system, by making a trade off (with purity), but can never get rid of it?

= query
1. When taking the reduced density operator, we scale the density operator of the composite system by trace over the other subsystem. The dimension of the reduced density operator is the same as the density operator that describes the composite system, which is by definition a bigger space. Hoow can a probability density matrix of the dimesnion of the composite system describe the subsystem?

= notes
1. What are density matrices? Alternative forumlation to represent quantum states.
2. Properties of density matrices:
  1. hermiticity
  2. positive semi definite
  3. trace 1
  4. projector
