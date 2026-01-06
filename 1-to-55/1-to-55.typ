#set page(
      paper: "a4",
      margin: 1in,
      fill: black,
)
#set text(fill: white, font: "New Computer Modern", size: 10pt)
#set par(justify: true, first-line-indent: 0pt)

// --- Custom Quantum Commands ---
#let ket(content) = $lr(| #content angle)$
#let bra(content) = $lr(angle #content |)$
#let braket(l, r) = $lr(angle #l | #r angle)$
#let outer(l, r) = $ket(#l) bra(#r)$
#let ip(l, r) = $braket(#l, #r)$ // shorthand for inner product
#let otimes = sym.times.o
#let comm(a, b) = $[#a, #b]$
#let acomm(a, b) = ${#a, #b}$
#let hbar = sym.planck

= Ex 2.1
Show that $(1, -1)$, $(1, 2)$ and $(2, 1)$ are linearly dependent.

Three vectors are said to be linearly independent iff for $alpha v_1 + beta v_2 + gamma v_3 = 0$ iff $alpha=0, beta=0, gamma=0$.
Thus, if we show that for $alpha != 0, beta != 0, gamma != 0$, we will have shown linear dependence of $v_1, v_2, v_3$.
For $(2, 1), (1, 2)$ and $(1, -1)$ and $alpha=1, beta=-1, gamma=-1$:
    $ 1(2, 1) - 1(1, 2) - 1(1, -1) = 0 $


    = E 2.2
    Given transformation $A$: $A ket(0) -> ket(1), A ket(1) -> ket(0)$.
    Write matrix representation.

    Let $A = mat(a, b; c, d)$.
    $ A vec(1, 0) = vec(a, c) = vec(0, 1) => a=0, c=1 $
    $ A vec(0, 1) = vec(b, d) = vec(1, 0) => b=1, d=0 $
    So, $A = mat(0, 1; 1, 0) = sigma_x$.

    Now, given matrix representation of $A$ in some other basis:
    $ A ket(0) -> 1/sqrt(2) (ket(0) - ket(1)), quad A ket(1) -> 1/sqrt(2) (ket(0) + ket(1)) $
    $ A vec(1, 0) = 1/sqrt(2) vec(1, -1) => vec(a, c) = 1/sqrt(2) vec(1, -1) => a=1/sqrt(2), c=-1/sqrt(2) $
    $ A vec(0, 1) = 1/sqrt(2) vec(1, 1) => vec(b, d) = 1/sqrt(2) vec(1, 1) => b=1/sqrt(2), d=1/sqrt(2) $
    So $A = 1/sqrt(2) mat(1, 1; -1, 1)$.

    = Bonus
    i) What is $A$ in $ket(+) -> ket(+), ket(-) -> ket(-)$? \
This is the identity transformation. The matrix for this in the Hadamard basis is the identity matrix.
$A = mat(1, 0; 0, 1)$.

ii) What is $A$ in $ket(+) -> ket(0), ket(-) -> ket(1)$? \
This is the Hadamard transformation: $H = 1/sqrt(2) mat(1, 1; 1, -1)$.
$ H ket(+) = 1/sqrt(2) mat(1, 1; 1, -1) 1/sqrt(2) vec(1, 1) = 1/2 vec(2, 0) = vec(1, 0) = ket(0) $
$ H ket(-) = 1/sqrt(2) mat(1, 1; 1, -1) 1/sqrt(2) vec(1, -1) = 1/2 vec(0, 2) = vec(0, 1) = ket(1) $

iii) What is $A$ in $ket(1), ket(-1) -> ket(i 0), ket(11)$?
(Note: The source text for this section appears to contain mixed notation. The following is a direct transcription of the mathematical steps provided).
Transform by right multiplying by the inverse of the Hadamard transformation:
$ 1/sqrt(2) mat(1, 1; 1, -1)^(-1) $
Thus transformation A (X) has representations:
$ mat(0, i; 1, 1), 1/sqrt(2) mat(1, -i; 1, 1) $


= Ex 2.3
Let $A: V -> W$ and $B: W -> X$ be linear operators.
Show that the matrix representation for $B A$ is the matrix product of the representations for $B$ and $A$.

*Sol:* For $A: V -> W$, $A ket(v_j) = sum_i A_{i j} ket(w_i)$.
For $B: W -> X$, $B ket(w_i) = sum_k B_{k i} ket(x_k)$.
    $ B A ket(v_j) = B(A ket(v_j)) = B(sum_i A_{i j} ket(w_i)) = sum_i A_{i j} (B ket(w_i)) $
    $ = sum_i A_{i j} sum_k B_{k i} ket(x_k) = sum_k (sum_i B_{k i} A_{i j}) ket(x_k) $
    So, $(B A)_{k j} = sum_i B_{k i} A_{i j}$, which is the matrix product.


    = Ex 2.4
    Show that the identity operator $I$ has a diagonal matrix of 1s (Kronecker delta $delta_{i j}$).

    *Sol:* $I ket(v_j) = sum_i I_{i j} ket(v_i) = ket(v_j)$.
    To leave basis vectors unchanged, the $i$-th component of the $j$-th vector must be 1 if $i=j$ and 0 otherwise. Thus $I_{i j} = delta_{i j}$.


    = Ex 2.5
    Verify $f(y, z) = sum_i y_i^* z_i$ is an inner product on $bb(C)^n$.

    *Sol:*
    i) *Conjugate Symmetry:* $braket(z, y) = sum_i z_i^* y_i = (sum_i z_i y_i^*)^* = braket(y, z)^*$.
ii) *Positivity:* $braket(v, v) = sum_i |v_i|^2 >= 0$.
iii) *Linearity in 2nd argument:* $braket(y, alpha z) = sum_i y_i^* (alpha z_i) = alpha sum_i y_i^* z_i = alpha braket(y, z)$.


= Ex 2.6
Show that any inner product is conjugate linear in the first argument.

*Sol:*
$ braket(sum_i alpha_i w_i, v) = braket(v, sum_i alpha_i w_i)^* = (sum_i alpha_i braket(v, w_i))^* = sum_i alpha_i^* braket(w_i, v) $

*Bonus: Normalized forms*
For $ket(w) = (1,1)$, $norm(ket(w)) = sqrt(1^2+1^2) = sqrt(2)$.
    For $ket(v) = (1,-1)$, $norm(ket(v)) = sqrt(1^2+(-1)^2) = sqrt(2)$.
        Normalized: $1/sqrt(2)(1,1)$ and $1/sqrt(2)(1,-1)$.


        = Ex 2.7
        i) Verify that $ket(w) = (1,1)$ and $ket(v) = (1,-1)$ are orthogonal.

    *Sol:* If $braket(w, v) = 0$, they are orthogonal.
    $ braket(w, v) = (1, 1) vec(1, -1) = 1(1) + 1(-1) = 0 $
    So they are orthogonal.


    = Ex 2.8
    Prove that the Gram-Schmidt process...
    (Content truncated in source)


    = Ex 2.9
    Express Pauli operators in outer product notation using basis $ket(0), ket(1)$.

    *Sol:*
    $ sigma_x = mat(0, 1; 1, 0) = ket(0)bra(1) + ket(1)bra(0) $
    $ sigma_y = mat(0, -i; i, 0) = -i ket(0)bra(1) + i ket(1)bra(0) $
    $ sigma_z = mat(1, 0; 0, -1) = ket(0)bra(0) - ket(1)bra(1) $
    $ I = mat(1, 0; 0, 1) = ket(0)bra(0) + ket(1)bra(1) $


    = Ex 2.10
    Suppose $ket(v_j)$ is an orthonormal basis. What is the matrix representation for $ket(v_j)bra(v_k)$?

    *Sol:* Matrix elements $O_{a b} = bra(v_a) O ket(v_b)$.
    Here $O = ket(v_j)bra(v_k)$.
    $ (ket(v_j)bra(v_k))_{a b} = bra(v_a) ket(v_j) bra(v_k) ket(v_b) = delta_{a j} delta_{k b} $
    This means the matrix has a 1 at $(j, k)$ and 0 elsewhere.


    = Ex 2.11
    Find eigendecomposition of Pauli matrices.

    i) $sigma_x$: $det(sigma_x - lambda I) = lambda^2 - 1 = 0 => lambda = plus.minus 1$.
Eigenvectors: $ket(+) = 1/sqrt(2)vec(1, 1)$ for $lambda=1$, $ket(-) = 1/sqrt(2)vec(1, -1)$ for $lambda=-1$.
$ sigma_x = (+1)outer(+, +) + (-1)outer(-, -) $

ii) $sigma_y$: $det(sigma_y - lambda I) = lambda^2 - 1 = 0 => lambda = plus.minus 1$.
Eigenvectors: $ket(y+) = 1/sqrt(2)vec(-i, 1)$ for $lambda=1$, $ket(y-) = 1/sqrt(2)vec(i, 1)$ for $lambda=-1$.
$ sigma_y = (+1)outer(y+, y+) + (-1)outer(y-, y-) $

iii) $sigma_z$: $det(sigma_z - lambda I) = lambda^2 - 1 = 0 => lambda = plus.minus 1$.
Eigenvectors: $ket(0)$ for $lambda=1$, $ket(1)$ for $lambda=-1$.
$ sigma_z = (+1)outer(0, 0) + (-1)outer(1, 1) $


= Ex 2.12
Prove $mat(1, 1; 0, 1)$ is not diagonalizable.

*Sol:* It suffices to show it is not normal.
$ G = mat(1, 1; 0, 1), quad G^dagger = mat(1, 0; 1, 1) $
$ G^dagger G = mat(1, 1; 1, 2) != mat(2, 1; 1, 1) = G G^dagger $
Not normal, so not diagonalizable.


= Ex 2.13
Show that $braket(w, v)^* = braket(v, w)$.

*Sol:* Let $ket(v) = sum_i a_i ket(i)$ and $ket(w) = sum_j b_j ket(j)$.
$ braket(w, v) = sum_j sum_i b_j^* a_i braket(j, i) = sum_i b_i^* a_i $
$ braket(w, v)^* = (sum_i b_i^* a_i)^* = sum_i b_i a_i^* $
$ braket(v, w) = sum_i sum_j a_i^* b_j braket(i, j) = sum_i a_i^* b_i $
They are equal.


= Ex 2.14
Show that $(sum_i a_i A_i)^dagger = sum_i a_i^* A_i^dagger$.

*Sol:* Adjoint of sum is sum of adjoints: $(sum_i a_i A_i)^dagger = sum_i (a_i A_i)^dagger$.
Adjoint of scalar times operator: $(a_i A_i)^dagger = a_i^* A_i^dagger$.
Thus $(sum_i a_i A_i)^dagger = sum_i a_i^* A_i^dagger$.


= Ex 2.15
Show that $(A^dagger)^T = A^*$.

*Sol:* $A^dagger = (A^T)^*$.
$(A^dagger)^T = ((A^T)^*)^T = ((A^T)^T)^* = A^*$.


= Ex 2.16
Show $P^2=P$ for $P = sum_i outer(i, i)$.

*Sol:* $ P^2 = (sum_i outer(i, i)) (sum_j outer(j, j)) = sum_i sum_j ket(i) braket(i, j) bra(j) $
Using $braket(i, j) = delta_{i j}$:
$ P^2 = sum_i ket(i) bra(i) = P $


= Ex 2.17
Show that for a normal operator $A$, if it has real eigenvalues, then it is self-adjoint.

*Sol:* $A = sum_i lambda_i outer(i, i)$. Since $lambda_i$ are real, $lambda_i = lambda_i^*$.
$ A^dagger = sum_i lambda_i^* outer(i, i) = sum_i lambda_i outer(i, i) = A $


= Ex 2.18
Show unitary matrix eigenvalues have modulus 1.

*Sol:* $A A^dagger = I$. Let $A ket(v) = lambda ket(v)$.
$ norm(A ket(v))^2 = bra(v) A^dagger A ket(v) = braket(v, v) = norm(v)^2 $
Also $norm(A ket(v))^2 = |lambda|^2 norm(v)^2$.
Thus $|lambda|^2 = 1 => |lambda| = 1$.


= Ex 2.19
Show $sigma_x, sigma_y, sigma_z$ are self-adjoint and unitary.

*Sol:* For $sigma_z$:
$sigma_z^dagger = mat(1, 0; 0, -1)^T^* = sigma_z$ (Self-adjoint).
$sigma_z^2 = I$ (Unitary).
Same applies to $sigma_x$ and $sigma_y$.


= Ex 2.20
(Empty in source)


= Ex 2.21
(Empty in source)


= Ex 2.22
Show eigenvectors of Hermitian operator with different eigenvalues are orthogonal.

*Sol:* $A=A^dagger$. Let $A ket(i) = lambda_i ket(i)$ and $A ket(j) = lambda_j ket(j)$.
$ bra(i) A ket(j) = lambda_j braket(i, j) $.
Also $bra(i) A ket(j) = (A ket(i))^dagger ket(j) = lambda_i^* braket(i, j) = lambda_i braket(i, j)$ (since real eigenvalues).
$(lambda_i - lambda_j) braket(i, j) = 0$. Since $lambda_i != lambda_j$, $braket(i, j) = 0$.


= Ex 2.23
Problem: A projector is a normal operator.

*Sol:* $P^2=P, P=P^dagger$.
$ P P^dagger = P^2 = P $.
$ P^dagger P = P^2 = P $.
Commutes, so normal.


= Ex 2.24
Let $A$ be positive. Show $bra(v) A ket(v) >= 0$.

*Sol:* $A = B^dagger B$.
$ bra(v) A ket(v) = bra(v) B^dagger B ket(v) = norm(B ket(v))^2 >= 0 $.


= Ex 2.25
Show $A^dagger A$ is positive.

*Sol:* Show $bra(v) A^dagger A ket(v) >= 0$.
$ bra(v) A^dagger A ket(v) = norm(A ket(v))^2 >= 0 $.

 

= Ex 2.26
Given $ket(psi) = 1/sqrt(2)(ket(0) + ket(1))$.
i) Calculate $ket(psi)^(otimes 2)$.
ii) Calculate $ket(psi)^(otimes 3)$.

*Sol:*
i) $ket(psi) otimes ket(psi) = 1/2 (ket(00) + ket(01) + ket(10) + ket(11))$.
Vector: $1/2 vec(1, 1, 1, 1)$.

ii) $ket(psi)^(otimes 2) otimes ket(psi) = 1/sqrt(8) (ket(000) + ket(001) + ... + ket(111))$.
Vector: $1/sqrt(8) (1, 1, ..., 1)^T$.

 

= Ex 2.27
*Problem:* Calculate the following tensor products: a) $X times Z$, b) $I times X$, c) $X times I$.

*Solution:* The matrices are $X = mat(0, 1; 1, 0)$, $Z = mat(1, 0; 0, -1)$, and $I = mat(1, 0; 0, 1)$.

a) The tensor product is:
$ X otimes Z = mat(0, 1; 1, 0) otimes mat(1, 0; 0, -1) = mat(0 Z, 1 Z; 1 Z, 0 Z) = mat(0, 0, 1, 0; 0, 0, 0, -1; 1, 0, 0, 0; 0, -1, 0, 0) $

b) The tensor product is:
$ I otimes X = mat(1, 0; 0, 1) otimes mat(0, 1; 1, 0) = mat(1 X, 0 X; 0 X, 1 X) = mat(0, 1, 0, 0; 1, 0, 0, 0; 0, 0, 0, 1; 0, 0, 1, 0) $

c) The tensor product is:
$ X otimes I = mat(0, 1; 1, 0) otimes mat(1, 0; 0, 1) = mat(0 I, 1 I; 1 I, 0 I) = mat(0, 0, 1, 0; 0, 0, 0, 1; 1, 0, 0, 0; 0, 1, 0, 0) $

Note that $X otimes I != I otimes X$, so the tensor product is not commutative.

 

= Ex 2.28
Show that the transpose, complex conjugate, and adjoint operations distribute over the tensor product.

i) Show that $(A otimes B)^* = A^* otimes B^*$.
$ (A otimes B)^* = [A_{i j} [B_{i j}]]^* = [A_{i j}^* [B_{i j}^*]] = A^* otimes B^* $

ii) Show that $(A otimes B)^T = A^T otimes B^T$.
$ (A otimes B)^T = [A_{i j} [B_{i j}]]^T = [A_{j i} [B_{j i}]] = [A_{j i} B^T] = A^T otimes B^T $

iii) Show that $(A otimes B)^dagger = A^dagger otimes B^dagger$.
$ (A otimes B)^dagger = ((A otimes B)^T)^* = (A^T otimes B^T)^* = (A^T)^* otimes (B^T)^* = A^dagger otimes B^dagger $

 

= Ex 2.29
Given that $U U^dagger = U^dagger U = I$ and $V V^dagger = V^dagger V = I$, show that $(U otimes V)$ is unitary.

$ (U otimes V)(U otimes V)^dagger = (U otimes V)(U^dagger otimes V^dagger) = U U^dagger otimes V V^dagger = I otimes I = I $
This shows unitarity. Similarly:
$ (U otimes V)^dagger (U otimes V) = (U^dagger otimes V^dagger)(U otimes V) = U^dagger U otimes V^dagger V = I otimes I = I $

 

= Ex 2.30
Show that the tensor product of two Hermitian operators is Hermitian.
Given $A = A^dagger$ and $B = B^dagger$.
$ (A otimes B)^dagger = A^dagger otimes B^dagger = A otimes B $
Thus, $(A otimes B)^dagger = A otimes B$, which means the tensor product is Hermitian.

 

= Ex 2.31
Show that the tensor product of two positive operators is positive.
For $A$ with $bra(v) A ket(v) >= 0$ and $B$ with $bra(w) B ket(w) >= 0$, show that $bra(v otimes w) A otimes B ket(v otimes w) >= 0$.

The inner product is given by:
$ bra(v otimes w) (A otimes B) ket(v otimes w) = (bra(v) otimes bra(w))(A otimes B)(ket(v) otimes ket(w)) $
$ = bra(v) A ket(v) bra(w) B ket(w) $
Since we are given that $bra(v) A ket(v) >= 0$ and $bra(w) B ket(w) >= 0$, and multiplication of non-negative real numbers results in a non-negative real number:
$ bra(v) A ket(v) bra(w) B ket(w) >= 0 $
This proves the statement.

 

= Ex 2.32
Show that the tensor product of two projectors is a projector.
Let $A = sum_i outer(i, i)$ be a projector in $V$, and $B = sum_k outer(k, k)$ be a projector in $W$.
$ (A otimes B) = (sum_i outer(i, i)) otimes (sum_k outer(k, k)) = sum_(i, k) (ket(i) otimes ket(k)) (bra(i) otimes bra(k)) $
$ = sum_(i, k) outer(i k, i k) $
This describes a projector in $V otimes W$. This shows that projectors are closed under the tensor product.

 

= Ex 2.33
Show that $H^(otimes n) = 1/(sqrt(2)^n) sum_(x, y=0)^(2^n - 1) (-1)^(x dot y) outer(x, y)$.

Consider $H^(otimes 2)$:
$ (1/sqrt(2)(ket(0)+ket(1))bra(0) + 1/sqrt(2)(ket(0)-ket(1))bra(1))^(otimes 2) $
$ = 1/2 (outer(0, 0) + outer(1, 0) + outer(0, 1) + outer(1, 1))^(otimes 2) $
(Correction from source logic: The source expands $H^(otimes 2)$ by terms).
Looking at the pattern, the sign depends on $x_i y_i$.
$ H^(otimes n) = 1/(sqrt(2)^n) sum_(x, y = 0)^(2^n - 1) (-1)^(x_i y_i) outer(x, y) $

Show $H^(otimes 2)$ explicitly:
$ H^(otimes 2) = 1/2 sum_(x, y=0)^3 (-1)^(x dot y) outer(x, y) $
$ = 1/2 (outer(00, 00) + outer(01, 01) + outer(10, 10) + outer(11, 11) + outer(01, 00) + outer(00, 01) + outer(11, 10) + outer(10, 11) + outer(10, 00) + outer(11, 01) + outer(00, 10) + outer(01, 11)) $
(Note: The explicit expansion in the source text seems to list many cross terms consistent with the tensor product expansion).

 

= Ex 2.34
*Eigenvectors and Normalization*
Normalize the vectors corresponding to eigenvalues of $mat(4, 3; 3, 4)$.
Eigenvalues are 1 and 7.
$ket(1) = 1/sqrt(2) vec(1, -1)$; $ket(7) = 1/sqrt(2) vec(1, 1)$.

i) Square root of the matrix:
$ sqrt(mat(4, 3; 3, 4)) = sqrt(1) ket(1)bra(1) + sqrt(7) ket(7)bra(7) $
$ = 1 dot 1/2 mat(1, -1; -1, 1) + sqrt(7) dot 1/2 mat(1, 1; 1, 1) $

ii) Logarithm of the matrix:
$ log(mat(4, 3; 3, 4)) = log_2(1) ket(1)bra(1) + log_2(7) ket(7)bra(7) $
$ = 0 + log(7) dot 1/2 mat(1, 1; 1, 1) $

 

= Ex 2.35
(Empty in source)

 

= Ex 2.36
Show that the Pauli matrices except for $I$ have trace zero.

$ sigma_x: tr mat(0, 1; 1, 0) = 0 + 0 = 0 $
$ sigma_y: tr mat(0, -i; i, 0) = 0 + 0 = 0 $
$ sigma_z: tr mat(1, 0; 0, -1) = 1 - 1 = 0 $

 

= Ex 2.37
Show that $tr(A B) = tr(B A)$.
$ tr(A B) = sum_i (A B)_{i i} = sum_i sum_j A_{i j} B_{j i} $
$ tr(B A) = sum_i (B A)_{i i} = sum_i sum_j B_{i j} A_{j i} $
Since $i$ and $j$ are summation variables over the same index set, the two traces are equal.

 

= Ex 2.38
i) Show that $tr(A+B) = tr(A) + tr(B)$.
$ tr(A+B) = sum_i (A+B)_{i i} = sum_i (A_{i i} + B_{i i}) = sum_i A_{i i} + sum_i B_{i i} = tr(A) + tr(B) $

ii) Show that $tr(z A) = z tr(A)$.
$ tr(z A) = sum_i (z A)_{i i} = sum_i z A_{i i} = z sum_i A_{i i} = z tr(A) $

 

= Ex 2.39
*Inner product of operators*
Show that $braket(A, B) = tr(A^dagger B)$ satisfies inner product properties.

i) *Conjugate symmetry:*
$ braket(A, B)^* = (tr(A^dagger B))^* = tr((A^dagger B)^dagger) = tr(B^dagger A) = braket(B, A) $

ii) *Linearity in second argument:*
$ braket(A, alpha B + beta C) = tr(A^dagger (alpha B + beta C)) = alpha tr(A^dagger B) + beta tr(A^dagger C) = alpha braket(A, B) + beta braket(A, C) $

iii) *Positive definiteness:*
$ braket(A, A) = tr(A^dagger A) = sum_i (A^dagger A)_{i i} = sum_i sum_j (A^dagger)_{i j} A_{j i} = sum_(i, j) A_{j i}^* A_{j i} = sum_(i, j) |A_{j i}|^2 $
This sum of squares is always non-negative and is zero iff all $A_{j i} = 0$, i.e., $A=0$.

 

= Ex 2.40
Verify that $[X, Y] = 2i Z$ for Pauli matrices.
$ X Y - Y X = mat(0, 1; 1, 0) mat(0, -i; i, 0) - mat(0, -i; i, 0) mat(0, 1; 1, 0) $
$ = mat(i, 0; 0, -i) - mat(-i, 0; 0, i) $
$ = mat(2i, 0; 0, -2i) = 2i mat(1, 0; 0, -1) = 2i Z $

 

= Ex 2.41
Verify that $sigma_i sigma_j + sigma_j sigma_i = 2 delta_{i j} I$.

For $i=j$: $sigma_i^2 = I$.
    $ sigma_x^2 = mat(0, 1; 1, 0) mat(0, 1; 1, 0) = mat(1, 0; 0, 1) = I $
    $ sigma_y^2 = mat(0, -i; i, 0) mat(0, -i; i, 0) = mat(1, 0; 0, 1) = I $
    $ sigma_z^2 = mat(1, 0; 0, -1) mat(1, 0; 0, -1) = mat(1, 0; 0, 1) = I $

    For $i != j$: $sigma_i sigma_j + sigma_j sigma_i = 0$.

        *Examples:*
        - For $i=1, j=2$ ($X, Y$):
        $ X Y + Y X = mat(0, 1; 1, 0) mat(0, -i; i, 0) + mat(0, -i; i, 0) mat(0, 1; 1, 0) = mat(i, 0; 0, -i) + mat(-i, 0; 0, i) = mat(0, 0; 0, 0) = 0 $

        - For $i=2, j=3$ ($Y, Z$):
        $ Y Z + Z Y = mat(0, -i; i, 0) mat(1, 0; 0, -1) + mat(1, 0; 0, -1) mat(0, -i; i, 0) = mat(0, i; i, 0) + mat(0, -i; -i, 0) = 0 $

        - For $i=1, j=3$ ($X, Z$):
        $ X Z + Z X = mat(0, 1; 1, 0) mat(1, 0; 0, -1) + mat(1, 0; 0, -1) mat(0, 1; 1, 0) = mat(0, -1; 1, 0) + mat(0, 1; -1, 0) = 0 $

         

        = Ex 2.42
        Verify that $A B = 1/2 (comm(A, B) + acomm(A, B))$.

        Consider the RHS:
        $ 1/2 (comm(A, B) + acomm(A, B)) = 1/2 ((A B - B A) + (A B + B A)) = 1/2 (2 A B) = A B $

         

        = Ex 2.43
        Show that for $j, k = 1, 2, 3$,
        $ sigma_j sigma_k = delta_{j k} I + i sum_{l=1}^3 epsilon_{j k l} sigma_l $

        a) For $j=k=1$:
    $ sigma_1 sigma_1 = I $.
    RHS: $delta_{11} I + i sum epsilon_{11 l} sigma_l = I + 0 = I$. (Holds)

    b) For $j=1, k=2$:
$ sigma_1 sigma_2 = sigma_x sigma_y = i sigma_z $.
RHS: $delta_{12} I + i sum epsilon_{12 l} sigma_l = 0 + i(epsilon_{123} sigma_3) = i sigma_z$. (Holds)

c) For $j=1, k=3$:
$ sigma_1 sigma_3 = sigma_x sigma_z = -i sigma_y $.
RHS: $delta_{13} I + i sum epsilon_{13 l} sigma_l = 0 + i(epsilon_{132} sigma_2) = i(-1) sigma_2 = -i sigma_y$. (Holds)

 

= Ex 2.44
If $comm(A, B) = 0$ and $acomm(A, B) = 0$, show that $B=0$ if $A != 0$ (and A is invertible).

    $ A B - B A = 0 => A B = B A $
    $ A B + B A = 0 => A B = -B A $
    Combining: $A B = -A B => 2 A B = 0 => A B = 0$.
    If $A$ is invertible, multiply by $A^(-1)$:
        $ A^(-1) A B = A^(-1) 0 => B = 0 $.

         

        = Ex 2.45
        Show that $comm(A, B)^dagger = comm(B^dagger, A^dagger)$.

        *Proof:*
        $ comm(A, B)^dagger = (A B - B A)^dagger = (A B)^dagger - (B A)^dagger = B^dagger A^dagger - A^dagger B^dagger = comm(B^dagger, A^dagger) $

         

        = Ex 2.46
        Show that $comm(A, B) = -comm(B, A)$.

        *Proof:*
        $ comm(A, B) = A B - B A = -(B A - A B) = -comm(B, A) $

         

        = Ex 2.47
        For $A = A^dagger$ and $B = B^dagger$, show that $i comm(A, B)$ is Hermitian.

            $ (i comm(A, B))^dagger = i^dagger comm(A, B)^dagger = -i comm(B^dagger, A^dagger) = -i comm(B, A) $
            Using $comm(B, A) = -comm(A, B)$:
            $ = -i (-comm(A, B)) = i comm(A, B) $
            Thus, it is Hermitian.

             

            = Ex 2.48
            *Polar decomposition of a normal matrix.*
            Let $A$ be a normal matrix ($A A^dagger = A^dagger A$).
            $ A = P U = (A A^dagger)^(0.5) U = (A^dagger A)^(0.5) U = U P $
            $ => A = P U = U P $
            Where $U$ is unitary ($U U^dagger = U^dagger U = I$) and $P$ is positive ($braket(v, P v) >= 0$).

             

            = Ex 2.49
            a) If $A=P U$ and let positive operator $P$ be $A$.
        $ => A = A U => U = I $
        $ => A = A I $ (Right polar decomposition)
        $ => A = I A $ (Left polar decomposition)

        b) Find $P U = A$ for unitary $A$ ($A A^dagger = A^dagger A = I$).
    $ A = sqrt(A A^dagger) U = sqrt(I) U = I U $
    $ A = U sqrt(A^dagger A) = U sqrt(I) = U I $
    $ => A = I U = U I $, where $I$ is the positive operator.

    c) If $A=A^dagger$ (Hermitian), find $P$ and $U$.
$ A = sqrt(A A^dagger) U = sqrt(A^2) U = plus.minus A U $
$ A = U sqrt(A^dagger A) = U sqrt(A^2) = U (plus.minus A) $
(Note: The source text ends with a contradiction regarding all Hermitian operators being positive, seemingly highlighting a nuance in the definition of $sqrt(A^2)$ versus $A$ itself for non-positive Hermitian operators).

 

= Ex 2.50
*Polar Decomposition Example*
$ A = mat(1, 0; 1, 1) $
$A$ is positive (assuming real entries and checking specific criteria, though strict positivity requires checking eigenvalues or quadratic forms).
If $A$ is positive: $A = A U => U = I$.
    Left polar decomposition:
    $ mat(1, 0; 1, 1) = mat(1, 0; 1, 1) mat(1, 0; 0, 1) $
    Right polar decomposition:
    $ mat(1, 0; 1, 1) = mat(1, 0; 0, 1) mat(1, 0; 1, 1) $


 
= Ex 2.51
Verify that $H = 1/sqrt(2) mat(1, 1; 1, -1)$ is unitary.

*Sol:* To show see: $H H^dagger = H^dagger H = I$.
$ H H^dagger = 1/sqrt(2) mat(1, 1; 1, -1) dot 1/sqrt(2) mat(1, 1; 1, -1) = 1/2 mat(2, 0; 0, 2) = I $

 

= Ex 2.52
Verify that $H^2 = I$.

*Sol:*
$ H^2 = 1/sqrt(2) mat(1, 1; 1, -1) 1/sqrt(2) mat(1, 1; 1, -1) = 1/2 mat(2, 0; 0, 2) = I $

 

= Ex 2.53
Find eigenvalues and eigenvectors of $H$.

*Sol:* $H = 1/sqrt(2) mat(1, 1; 1, -1)$.
Consider $det(H - lambda I) = 0$. Note: We find eigenvalues of the matrix part first, then scale.
$ det mat(1-lambda, 1; 1, -1-lambda) = 0 $
$ => (1-lambda)(-1-lambda) - 1 = 0 $
$ => -1 - lambda + lambda + lambda^2 - 1 = 0 $
$ => lambda^2 = 2 => lambda = plus.minus sqrt(2) $
Scaling by factor $1/sqrt(2)$, $H$ has eigenvalues $plus.minus 1$.

*Eigenvectors of H (Detailed Calculation):*
i) For eigenvalue $+1$:
$ 1/sqrt(2) mat(1, 1; 1, -1) vec(a, b) = sqrt(1) vec(a, b) $
$ 1/sqrt(2) (a+b) = a $
$ 1/sqrt(2) (a-b) = b $
From first eq: $a+b = sqrt(2) a => b = (sqrt(2)-1)a$.
Set $a=1, b=sqrt(2)-1$.
$ ket(v_1) = vec(1, sqrt(2)-1) $
*Normalized:*
$ 1/sqrt(1^2 + (sqrt(2)-1)^2) vec(1, sqrt(2)-1) = 1/sqrt(1 + 2 - 2sqrt(2) + 1) vec(1, sqrt(2)-1) = 1/sqrt(4 - 2sqrt(2)) vec(1, sqrt(2)-1) $

ii) For eigenvalue $-1$:
$ 1/sqrt(2) mat(1, 1; 1, -1) vec(a, b) = -1 vec(a, b) $
$ 1/sqrt(2) (a+b) = -a => a+b = -sqrt(2)a => b = -(1+sqrt(2))a $.
(Note: The source text derivation for part (ii) deviates here, verifying the steps provided in the source below):
Source checks: $1/sqrt(2) mat(1, 1; 1, -1) vec(a, b) = -sqrt(2) vec(a, b)$ (Checks matrix part against scaled eigenvalue).
$ => a+b = -2a => b = -3a $. (This step in source seems distinct or assumes different scaling, transcription follows):
Set $a=1$: $ket(v_2) = vec(1, -1)$.
Normalized: $1/sqrt(1^2 + (-1)^2) vec(1, -1)$.

 

= Ex 2.54
Given $comm(A, B) = 0$, i.e., $A B = B A$.
Show that $e^A e^B = e^(A+B)$.

$ e^A e^B = (sum_i e^(lambda_i) outer(i, i)) (sum_j e^(lambda_j) outer(j, j)) $
Assuming simultaneous diagonalization basis $ket(i)$:
$ = sum_i e^(lambda_A) e^(lambda_B) outer(i, i) = sum_i e^(lambda_A + lambda_B) outer(i, i) = e^(A+B) $

 

= Ex 2.55
Show that $U(t, t_0) = e^(-i H (t_2 - t_1) / hbar)$ is unitary.

Consider $U(t_2, t_1) U^dagger (t_2, t_1)$:
$ = e^(-i H (t_2 - t_1) / hbar) e^([-i H (t_2 - t_1) / hbar]^dagger) $
$ = e^(-i H (t_2 - t_1) / hbar) e^(+i H^dagger (t_2 - t_1) / hbar) $
Since $H$ is Hermitian ($H=H^dagger$) and commutes with itself:
$ = e^0 = I $

Consider $U^dagger (t_2, t_1) U(t_2, t_1)$:
$ = e^(i H^dagger (t_2 - t_1) / hbar) e^(-i H (t_2 - t_1) / hbar) = e^0 = I $

 

= List of Problems

Before going further, let me see. What all problems need I need help with.
- Ex 2.1 to 2.7: Solved.
- *Ex 2.8: I need help.*
- Ex 2.9 to 2.19: Solved.
- *Ex 2.20: I need help.*
- *Ex 2.21: I need help.*
- Ex 2.22 to Ex 2.30: Solved.
- *Ex 2.31: I need help.*
- Ex 2.32: Solved.
- *Ex 2.33: I need help.*
- *Ex 2.34: I need help.*
- *Ex 2.35: I need help.*
- Ex 2.36: Solved.
- Ex 2.37 to Ex 2.38: Solved.
- *Ex 2.39: I need help.*
- Ex 2.40 to 2.47: Solved.
- *Ex 2.48: I need help.*
- Ex 2.49 to 2.52: Solved.
- *Ex 2.53: I need help.*
- Ex 2.54 to Ex 2.55: Solved.
- *Ex 2.56: I need help.*

