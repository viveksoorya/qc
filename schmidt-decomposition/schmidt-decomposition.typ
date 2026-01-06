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
  #text(size: 1.5em, weight: "bold")[Schmidt Decomposition] \
  #v(0.5em)
  Vivek Soorya Maadoori
]

#outline()

+ Does Schmidt decomposition only work for composite systems?
+ Why are the terms in the decomposition scaled by probabilities and not amplitudes?

+ The tensor product space could have Hilbert spaces of different dimensions.
  Then, how can both systems' probability density operators have the same eigenvalues?
  Does the Schmidt decomposition then, apply only to composite systems made of systems of equal dimension?
