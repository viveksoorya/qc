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

// Macro for Bell States
#let bellstates = $ (ket(00) + ket(11))/sqrt(2), (ket(00) - ket(11))/sqrt(2), (ket(01) + ket(10))/sqrt(2), (ket(01) - ket(10))/sqrt(2) $

// -----------------------------------------------------------

#align(center)[
  #text(size: 1.5em, weight: "bold")[Superdense Coding] \
  #v(0.5em)
  Vivek Soorya Maadoori \
  #datetime.today().display()
]

Superdense coding is about transformations.

= setup
1. *Task*: Send 2 classical bits by sending 1 qubit across.
2. To carry out this task we use an entangled pair and transform it to encode information;
3. There are four entangled pairs:
   #bellstates
   and the possibilities of four values of 2 classical bits:
   00, 11, 01, 10;
   00: $(ket(00) + ket(11))/sqrt(2)$,
   11: $(ket(00) - ket(11))/sqrt(2)$,
   01: $(ket(01) + ket(10))/sqrt(2)$,
   10: $(ket(01) - ket(10))/sqrt(2)$

4. The four entangled pairs are I, X, Z and XZ transformations apart. #footnote[XZ = -2iY, but -2 is global amplitude scalar, and this does not affect our bell state to classical double-bit encoding; the phase is global and so can be ignored and the magnitude disappears upon renormalization] #footnote[permutational invariance for bell states and transformations]

5. Using these transformations Alice can send her two classical bits to Bob by sending over a transformed qubit. Upon receipt of the qubit, Bob can measure it in the Bell basis #footnote[Appendix C] since it forms an orthonormal basis. #footnote[Refer to appendix B, to see how bell basis forms an orthonormal basis.]

= solution
steps:
1. Alice prepares two qubits in an EPR state, and sends one of the qubits to Bob.
2. Bob performs the necessary transformation to reflect his choice and sends it back.
3. Alice measures the two qubits in bell basis and uses the map to obtain the classical information that is Bob's choice.

= Appendix A
1. When there are 32 superpositions, why are the 4 states so special that they get their own two names (EPR pairs and bell states)?
2. There are 32 equally weighted superpositions of $ket(10), ket(01), ket(10), ket(11).$ Square the cardinality of the set of equally weighted superpositions. Taking into account negative relative phase, we double that number.
   $ => 2 times 4^2 = 32. $

3. Of these 8 are not actually superpositions #footnote[consider $(ket(00) - ket(00))/2$, what would phase mean here? especially since differing by relative phase does not yield orthogonality in this case. That is, when $(ket(00) - ket(00))/2 = (ket(00) + ket(00))/2$ what does relative phase signify then?]:
   - $(ket(00) + ket(00))/2, (ket(00) - ket(00))/2, (ket(01) + ket(01))/2, (ket(01) - ket(01))/2, $
   - $(ket(10) + ket(10))/2, (ket(10) - ket(10))/2, (ket(11) + ket(11))/2, (ket(11) - ket(11))/2, $

4. Of the remaining 12 are duplicates owing to commutativity of addition:
   $ {{1/sqrt(2)(ket(00) + ket(10)), 1/sqrt(2)(ket(10) + ket(00))}, dots} $
   where each pair differ at most by global phase like in
   $ 1/sqrt(2)(ket(00) - ket(10)) " and " 1/sqrt(2)(ket(10) - ket(00)) $

5. Of the remaining, 8 are not entangled, meaning they are tensor product decomposable.
6. This leaves us with $2 times 4^2 - 12 - 8 = 32 - 20 = 4$ which are
   - $(ket(100) + ket(110))/sqrt(2)$
   - $(ket(100) - ket(111))/sqrt(2)$
   - $(ket(101) + ket(111))/sqrt(2)$
   - $(ket(101) - ket(110))/sqrt(2)$

= Appendix B
1. Bell states are pair wise orthogonal. #footnote[Where inner product is defined as product of inner product of qubits in the respective subsystems ie constituent Hilbert spaces of the tensor product hilbert space]
   $ (ket(00) + ket(11))/sqrt(2) " and " (ket(00) - ket(11))/sqrt(2) $
   are orthogonal since they differ by relative phase.

2. Same with
   $ (ket(01) + ket(10))/sqrt(2) " and " (ket(01) - ket(10))/sqrt(2) $

3. Now consider
   $ (ket(00) + ket(11))/sqrt(2) " and " (ket(01) - ket(10))/sqrt(2) $

4. These two are also orthogonal since,
   $ ((bra(00)+ bra(11))/sqrt(2)) ((ket(01) - ket(10))/sqrt(2)) $
   $ = ((braket(00, 01) - braket(00, 10) + braket(11, 01) - braket(11, 10))/sqrt(2)) $
   $ = (braket(0, 0) dot braket(0, 1) - braket(0, 1) dot braket(0, 0) + braket(1, 0) dot braket(1, 1) - braket(1, 1) dot braket(1, 0))/2 $
   $ = (1 dot 0 - 0 dot 1 + 0 dot 1 - 1 dot 0)/2 $
   $ = (0 - 0 + 0 - 0)/2 = 0 $

5. By transitivity all the bell states are orthogonal to each other.

= Appendix C
1. You have to measure it in the bell basis and not any other basis like the computational basis, since measuring it in other bases would not return any bell state with probability 1, but when measured in the bell basis, one of the four bell states is returned with probability 1 and the other three with probability 0, accommodating deterministic communication.
2. Consider the following scenario:
   a. If you are Bob and trying to decode the information Alice sent (assuming you have the mapping from qubit state to classical information), you might be tempted to measure it in the computational basis, but you will quickly (or taking your time) realize that you will lose information about relative phase and will only be able to pin the information down to one of two camps of the bell states, where members of the camp only differ by a relative phase.
   b. Note then that at this point you want to extract phase information.
   c. Also note that if you want to extract any information at all, you will have to measure, or do it before measurement.
   d. All we can done before the measurement, is unitary transformations and so to recover/extract the relative phase, perform a unitary transformation.
   e. It turns out that *the* unitary transformation (for there could be any number of unitary transformations) that does the job is basis change transformation.
   f. Or you could just shorten the process and directly measure it in the bell basis.
   g. But if you want to measure it in the computational basis, first perform the necessary unitary transformation.
