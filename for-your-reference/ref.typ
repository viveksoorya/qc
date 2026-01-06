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

== definitions
norm preserving transformations are called isometries; (metron [Greek] meant measure)

== notation
$cal(L)(V,W)$: set of linear map $cal(L)$ from vector spaces V to W

== Proof cycle and related stuff
How do I prove this? How do I approach thinking about this in terms of proof; How do I go from this conjecture to thinking; we need to start from things we know to be true and arrive here; this method is known as direct proof; there are other methods too, but a proof generally needs an idea;

1. Understand every term of the proof at a cursory level.
2. Understand what is being asked in those terms?
3. Now you understand the task at this point.
4. Ideate and attempt; sketch out promising avenues that look hopeful.
5. Once you have a promising sketch, write it in better detail.
6. Cycle until you reach a satisfactory proof.
7. Write down ideas while Ideating. Think on paper.

=== Pauli gates on $e_i$

== Pauli Gates
Quantum gates are simply operators. But since we are doing quantum computation, we adapt the term gate instead of operators.

$ I = mat(1, 0; 0, 1) quad X = mat(0, 1; 1, 0) quad Y = mat(0, -i; i, 0) quad Z = mat(1, 0; 0, -1) $

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

= come back to this later
what is the POVM formalism?
1. You use it when you don't care about the post-measurement state.
2. It is an established elegant formation that is adopted by researchers in quantum computation and quantum information.
3. What is the added advantage of a POVM? What exactly is elegant about the formalism?
4. How exactly is the POVM formation used for the analysis of measurements?
   ${M_m}$ satisfy the completeness relation.
   What else is necessary to go from operator to measurement operator. Does it say, D a) have to be hermitian?
