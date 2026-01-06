#set page(
  paper: "a4",
  margin: 1in,
  fill: black,
)

// Fix: Use a standard font available in Typst
#set text(fill: white, font: "New Computer Modern", size: 10pt)
#set par(justify: true, first-line-indent: 0pt)

// --- Definitions (Must be at the top) ---
#let ket(content) = $lr(| #content angle)$
#let bra(content) = $lr(angle #content |)$
#let braket(l, r) = $lr(angle #l | #r angle)$
#let outer(l, r) = $ket(#l) bra(#r)$
#let tr = "Tr"
#let comm(a, b) = $[#a, #b]$
#let acomm(a, b) = ${#a, #b}$
#let otimes = sym.times.o

#let hbar = sym.planck

// -----------------------------------------------------------

= Ex 2.56
Use the spectral decomposition to show that $K equiv -i log(U)$ is Hermitian for any Unitary $U$, and thus $U = exp(i K)$ for some Hermitian $K$.

*Sol:*
Suffices to show that $-i log(U) = (-i log(U))^dagger$.
Suffices to show that $-i log(U) = i (log(U))^dagger$.
Suffices to show that $-i log(U) = i log(U^dagger)$.
Suffices to show that $i log(U^(-1)) = i log(U^dagger)$.
Suffices to show that $U^(-1) = U^dagger$, but unitary operation is defined so.


= Ex 2.57
To show that cascaded measurements are single measurements, we would have to show two things: that the cascaded measurement takes any arbitrary state to the same state as the single measurement, and that the probability distribution of eigenvalues of the cascaded measurement is the same as that of the single measurement.

i) *Same eigenvector:*
Let $ket(psi)$ be the initial arbitrary state.

Post first measurement ($L_l$):
$ (L_l ket(psi)) / sqrt(bra(psi) L_l^dagger L_l ket(psi)) $

Post second measurement ($M_m$):
Numerator:
$ M_m ((M_m (L_l ket(psi)) / sqrt(bra(psi) L_l^dagger L_l ket(psi)))) / sqrt((bra(psi) L_l^dagger) / (bra(psi) L_l^dagger L_l ket(psi)) M_m^dagger M_m (L_l ket(psi)) / sqrt(bra(psi) L_l^dagger L_l ket(psi))) $
(Note: The structure above follows the LaTeX logic which seems to nest the normalization factors).

Denominator:
$ = sqrt((bra(psi) L_l^dagger M_m^dagger M_m L_l ket(psi)) / (bra(psi) L_l^dagger L_l ket(psi))) $

The state after second measurement:
$ (M_m L_l ket(psi)) / (sqrt(bra(psi) L_l^dagger L_l ket(psi)) (sqrt(bra(psi) L_l^dagger M_m^dagger M_m L_l ket(psi)) / sqrt(bra(psi) L_l^dagger L_l ket(psi)))) $

$ = (M_m L_l ket(psi)) / (cancel(sqrt(bra(psi) L_l^dagger L_l ket(psi))) (sqrt(bra(psi) L_l^dagger M_m^dagger M_m L_l ket(psi)) / cancel(sqrt(bra(psi) L_l^dagger L_l ket(psi))))) $

$ = (M_m L_l ket(psi)) / sqrt(bra(psi) L_l^dagger M_m^dagger M_m L_l ket(psi)) $


= Ex 2.58
Suppose we prepare a quantum system in an eigenstate $ket(psi)$ of some observable $M$, with corresponding eigenvalue $m$. What is the average observed value of $M$, and the standard deviation?

*Average value:* $braket(phi, M phi)$
$ => (bra(psi) M_m^dagger) / sqrt(bra(psi) M_m^dagger M_m ket(psi)) M (M_m ket(psi)) / sqrt(bra(psi) M_m^dagger M_m ket(psi)) $
$ = (bra(psi) M_m^dagger M M_m ket(psi)) / (bra(psi) M_m^dagger M_m ket(psi)) $
$ = (bra(psi) M_m^dagger M_m ket(psi)) / (bra(psi) M_m^dagger M_m ket(psi)) = 1? $

Note that since the effect of $M$ on $M_m$ was to leave it unchanged, the same will happen with $M^2$, meaning $sqrt(angle M^2 angle - angle M angle^2) = sqrt(1 - 1) = 0$.

*Bonus:*
Show that $sqrt(angle (M - angle M angle)^2 angle) = sqrt(angle M^2 angle - angle M angle^2)$.

= Ex 2.59
Suppose we have a qubit in the state $ket(0)$, and we measure the observable $X$. What is the average value of $X$? What is the standard deviation of $X$?

$ angle X angle = bra(0) X ket(0) = braket(0, 1) = 0 $

$ sqrt(angle X^2 angle - angle X angle^2) = sqrt(bra(0) X^2 ket(0) - (bra(0) X ket(0))^2) = sqrt(1 - 0) = plus.minus 1 $


= Ex 2.60
i) Show that $vec(v) dot vec(sigma)$ has eigenvalues $plus.minus 1$.

*Solution:*
Let $vec(v)$ be $vec(a, b, sqrt(1 - a^2 - b^2))$.
$ => vec(v) dot vec(sigma) = a sigma_1 + b sigma_2 + c sigma_3 $
$ = mat(delim: "[", sqrt(1 - a^2 - b^2), a - i b; a + i b, -sqrt(1 - a^2 - b^2)) $

The characteristic equation is:
$ (sqrt(1 - a^2 - b^2) - lambda)(-sqrt(1 - a^2 - b^2) - lambda) - (a - i b)(a + i b) = 0 $
$ => lambda^2 - (1 - a^2 - b^2) - a^2 - b^2 = 0 $
$ => lambda^2 - 1 + a^2 + b^2 - a^2 - b^2 = 0 $ (Wait, the source simplifies this to $lambda^2 = 1$).
$ => lambda^2 = 1 => lambda = plus.minus 1 $.

ii) Show that the projectors onto the corresponding eigenspaces are given by $P_(plus.minus) = (I plus.minus vec(v) dot vec(sigma))/2$.

So long as $vec(v) dot vec(sigma)$ defines a measurement:
$ vec(v) dot vec(sigma) = sum_i lambda_i P_i = (+1 P_+) + (-1 P_-) $
$ => vec(v) dot vec(sigma) = P_+ - P_- $ (Eq 1)
$ I = sum_i P_i = P_+ + P_- $ (Eq 2)

Using Eq 2 in Eq 1:
$ vec(v) dot vec(sigma) = P_+ - (I - P_+) = 2 P_+ - I $
$ => P_+ = (I + vec(v) dot vec(sigma))/2 $

Similarly:
$ vec(v) dot vec(sigma) = (I - P_-) - P_- = I - 2 P_- $
$ => P_- = (I - vec(v) dot vec(sigma))/2 $

Thus, $P_(plus.minus) = (I plus.minus vec(v) dot vec(sigma))/2$.


= Ex 2.61
Calculate the probability of obtaining the result +1 for a measurement of $vec(v) dot vec(sigma)$, given that the state prior to measurement is $ket(0)$. What is the state of the system after the measurement if +1 is obtained?

Probability of measuring +1 when the system is in the state $ket(0)$ is given by:
$ p(+1) = bra(0) P_+ ket(0) $ (Correction: standard formula usually involves projector).
Source calculation:
$ = bra(0) (vec(v) dot vec(sigma)) ket(0) $ (Note: Source calculates expectation value or probability? The text says "p(+1) = ...", but calculation seems to be the expectation value term $bra(0) A ket(0)$ which usually relates to average, unless using specific projector logic. Let's transcribe the source math exactly).

$ = mat(1, 0) mat(delim: "[", sqrt(1 - a^2 - b^2), a - i b; a + i b, -sqrt(1 - a^2 - b^2)) vec(1, 0) $
$ = mat(1, 0) vec(sqrt(1 - a^2 - b^2), a + i b) $
$ = sqrt(1 - a^2 - b^2) $

The state of the system after the measurement is obtained is $P_+$, i.e., $(I + vec(v) dot vec(sigma))/2$ (acting on the state).


= Ex 2.62
Show that any measurement where the Measurement operators and the POVM elements coincide is a projective measurement.

POVM elements: ${P_i}$ such that $sum_i P_i = I$.
Measurement Operators: ${M_m}$ describe a measurement such that $bra(psi) M_m ket(psi) = "pr"(m)$. (Note: Usually $"pr"(m) = bra(psi) M_m^dagger M_m ket(psi)$).

Show that if these two coincide such that we have $sum_m M_m = I$, then $M_m M_n = 0$ where $m != n$.

*Solution:*
Consider two projectors $M_m, M_n$ such that they are together complete.
$ => M_m = I - M_n $
Now consider $M_m M_n ket(psi)$:
$ = M_m (M_n ket(psi)) $
$ = (I - M_n) (M_n ket(psi)) $
$ = (M_n ket(psi)) - (M_n^2 ket(psi)) $
Assuming they are projectors ($M_n^2 = M_n$):
$ = M_n ket(psi) - M_n ket(psi) = 0 $
Thus, $M_m M_n = 0$.

This solves it for the case where there are two projectors.
What about the case where there are 3 or n projectors?
Is it that as long as a projector is orthogonal with its complement with Identity, every pair of projectors conceivable for that observable is orthogonal?
*Note from source:* This solution is not right.


= Ex 2.63
Suppose a measurement is described by measurement operators $M_m$. Show that there exist unitary operators $U_m$ such that $M_m = U_m sqrt(E_m)$, where $E_m$ is the POVM associated with the measurement.

*Solution:*
We know that any linear operator can be written as the product of a unitary operator and a positive operator (Polar Decomposition).
Note that $E_m$ is a positive operator (defined as $M_m^dagger M_m$). Note also that $sqrt(E_m)$ is also a positive operator.
Thus, there exists a unitary operator $U_m$ such that $M_m = U_m sqrt(E_m)$.

