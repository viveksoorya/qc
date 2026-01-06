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

#align(center)[
  #text(size: 1.5em, weight: "bold")[Density Operators cant have non-zero elements in all diagonal positions] \
  #v(0.5em)
  Vivek Soorya Maadoori
]

*Lemma:*
A density operator of a pure state cannot have non-zero elements in all diagonal positions.

*Proof:*

#footnote[Density operators of a pure state are projectors]
Density operators are positive operators and so are diagonalizable.
Assume the diagonalized density matrix $rho_D$. Assume one nonzero entry.

Let $rho_D = outer(psi, psi) " for some " ket(psi)$.
For the state $ket(psi)$, let the entries be $x_n, n in cal(N)$.
For any indices i, j such that i $!=$ j, either $x_i$ is 0 or $x_j$ is zero, since all off diagonal elements are zero.
Thus, at least one of $x_i$ and $x_j$ are zero for any distinct pair of indices.
$=>$ There is only one index i such that $x_i != 0$
$=>$ There is only one positive diagonal element in $rho_D$

Thus, given the non diagonal elements of a projector are 0 and that the projector is a positive matrix, There can only be one non-zero diagonal element. #sym.square.filled
