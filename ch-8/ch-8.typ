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
#let comm(a, b) = $[#a, #b]$
#let acomm(a, b) = ${#a, #b}$
#let otimes = sym.times.o
#let hbar = sym.planck
#let dagger = sym.dagger

// -----------------------------------------------------------

#align(center)[
  #text(size: 1.5em, weight: "bold")[Quantum Operations, Quantum Noise] \
  #v(0.5em)
  Vivek Soorya Maadoori
]

= 1. Quantum Operations

#v(1cm)
*#underline[Exercise 8.1]: (Unitary evolution as a quantum operation)*
[cite_start]Pure states evolve under unitary transforms as $ket(psi) arrow U ket(psi)$. [cite: 22]
[cite_start]Show that, equivalently, we may write $rho arrow epsilon (rho) equiv U rho U^dagger$, for $rho = outer(psi, psi)$. [cite: 23]

#underline[Solution]:
1. [cite_start]If pure states evolve as $ket(psi) arrow U ket(psi)$, then their duals evolve like so $bra(psi) arrow bra(psi) U^dagger$. [cite: 24, 25]

2. [cite_start]Now consider how $rho$ would evolve: [cite: 25]
   [cite_start]$ rho = outer(psi, psi) arrow U ket(psi) bra(psi) U^dagger = U rho U^dagger $. [cite: 26]
$ square.filled $

#v(1cm)
*#underline[Exercise 8.2]: (Measurement as a quantum operation)*

[cite_start]Recall from Section 2.2.3 (on page 84) that a quantum measurement with outcomes labeled by $m$ is described by a set of measurement operators $M_m$ such that $sum_m M^dagger_m M_m = I$. [cite: 27] Let the state of the system immediately before the measurement be $rho$.
[cite_start]Show that for $epsilon_m(rho) equiv M_m rho M_m^dagger$, the state of the system immediately after the measurement is [cite: 28]
$ (epsilon_m (rho)) / tr(epsilon(rho)) $
[cite_start]Also show that the probability of obtaining this measurement result is $p(m) = tr(epsilon_m (rho))$. [cite: 28]

#v(0.5cm)
[cite_start]#underline[Solution]: [cite: 29]
First let's show the post measurement state of the density operator.

1. [cite_start]Note that $epsilon_m(rho) equiv M_m rho M_m^dagger = M_m outer(psi, psi) M_m^dagger$. [cite: 29]

2. [cite_start]Post measurement state is $(M_m ket(psi)) / sqrt(bra(psi) M_m^dagger M_m ket(psi))$. [cite: 29, 30]

3. Post measurement state of the dual is $(bra(psi) M_m^dagger) / sqrt(bra(psi) M_m^dagger M_m ket(psi))$. (Note: Denominator inside square root typically involves $M^dagger M$, corrected from source text logic where applicable)[cite_start]. [cite: 30, 31]

4. Thus, the post measurement state of $rho$ is $(M_m outer(psi, psi) M_m^dagger) / (bra(psi) M_m^dagger M_m ket(psi))$ #footnote[Assuming the measurement operator commutes with its adjoint. [cite_start]Does it?]. [cite: 31, 32, 33]

5. [cite_start]Note that the numerator is $epsilon_m(rho)$ and that the denominator is $tr(epsilon_m(rho))$. [cite: 33]

#v(0.5cm)
Now, let's see the probability.
1. [cite_start]Note that the probability of measuring $m$ after measurement is given by $p(m) = bra(psi) M_m^dagger M_m ket(psi)$. [cite: 34, 35]
2. [cite_start]Note that this is $tr(epsilon(rho))$. [cite: 35]
$ square.filled $

