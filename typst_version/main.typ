#import "@preview/fletcher:0.5.0" as fletcher: diagram, node, edge

#set list(marker: [--])
#show sym.nothing: set text(font: "Libertinus Math"); // fix null set font
#set text(font: "CMU Serif")
#let t(s, spacing: 5) = {
  " " * spacing + s
}

#align(center, [
  = Concepts Notes
  _\@saffron_
])

= Logic
=== logical operators
- $not, and, or, =>, <=>$

=== quantifiers
- $forall, exists$

=== helpful equivalences
- $p and (q or r) equiv (p and q) or (p and r)$
- $p or (q and r) equiv (p or q) and (p or r)$
- $not (p and q) equiv not p or not q$
- $not (p or q) equiv not p and not q$
- $not (p => q) equiv p and not q$
- $p => q equiv not q => not p$ ("contrapositive form")
- $not (forall x in S, p(x)) equiv exists x in S, not p(x)$
- $not (exists x in S, p(x)) equiv forall x in S, not p(x)$

=== definitions
truth tables can prove equivalences

tautology: always true / contradiction: always false

divisibility: Let $a,b in ZZ$. Then $a | b <==> (exists k in ZZ, a k = b)$

parity: an integer $a$ is even iff $2 | a$ and odd otherwise (i.e. $2  | a + 1$).

= Proof Strategies
TODO AFSOC, contraposition, etc etc from your old notes.
- ($p => q$) assume $p$, prove $q$
- ($p or q => r$) by cases: assume $p$, prove $r$. assume $q$, prove $r$
#import emoji: finger
- we find a contradiction $finger.r finger.l$

= Sets
- list notation: $A = {1,2,3, dots}$
- set builder notation: $B = {n : n "is prime"}$
- number sets
  - naturals $NN = {0,1,2,dots}$
  - integers $ZZ = {dots, -2,-1,0,1,2,dots}$
  - rationals $QQ = {a/b : a,b in ZZ and b != 0}$
  - reals $RR = {"the number line"}$
  - closure properties
    - $+ \/ times$ of two $NN$ is still $NN$
    - $+ \/ - \/ times$ of two $ZZ$ is still $ZZ$
    - $+ \/ - \/ times \/ div$ (except 0) of two $QQ \/ RR$ is still $QQ \/ RR$
  
definitions
- $x in.not X "iff" not (x in X)$
- $X = nothing "iff" forall x, x in.not X$
- $A subset.eq B "iff" forall x in A, x in B$
- $X sect Y = {a : a in X and a in Y}$
- $X union Y = {a : a in X or a in Y}$
- $X without Y = {a : a in X and a in.not Y}$
- $X times Y = {(x,y) : x in X and y in Y}$
- $X = Y "iff" X subset.eq Y and Y subset.eq X$
- $sect.big_(i in I) X_i = {a : forall i in I, a in X_i}$
- $union.big_(i in I) X_i = {a : exists i in I, a in X_i}$
- $cal(P)(A) = {X : X subset.eq A}$

de Morgan's for sets
- $X without (Y sect Z) = (X without Y) union (X without Z)$
- $X without (Y union Z) = (X without Y) sect (X without Z)$
- $X without (sect.big_(i in I) Y_i) = union.big_(i in I) (X without Y_i)$
- $X without (union.big_(i in I) Y_i) = sect.big_(i in I) (X without Y_i)$

= Functions
definitions
- a function $f: X -> Y$ is an assignment that satisfies
  - totality: $forall x in X, f(x)$ is defined (i.e. domain $= X$)
  - existence: $forall x in X, f(x) in Y$ (i.e. codomain $= Y$)
  - uniqueness: $forall x, x' in X, (x = x' => f(x) = f(x'))$ (i.e. VLT)
- Gr$(f) = {(x,y) in X times Y : f(x) = y}$
- let $f: X -> Y, g: Y->Z$. then $g compose f: X -> Z = g(f(x))$
- $f = g$ iff same domain, same codomain, and $forall x in X, f(x) = g(x)$
- $"id"_X : X->X$ is $"id"_X (x) = x$
- characteristic function of $U$ in $X$ is $chi_U (a)$ is 1 if $a in U$, 0 if not.
- image of $U$ under $f$ is $f[U] = {y in Y : exists x in U, y = f(x)}$
- preimage of $V$ under $f$ is $f^(-1)[V] = {x in X : f(x) in V}$
- $f$ is injective iff $forall a, b in X, (f(a) = f(b) => a = b)$
- $f$ is surjective iff $forall y in Y, exists x in X, f(x) = y$
- $f$ is bijective iff $f$ is both injective and surjective
- a left inverse for $f$ is a function $g: Y -> X$ s.t. $g compose f = "id"_X$
  - this implies $f$ is injective
- a right inverse for $f$ is a function $g: Y -> X$ s.t. $f compose g = "id"_Y$
  - this implies $f$ is surjective
- an inverse (two-sided) for $f$ is a function $g$ that is both left and right inverse, also denoted $f^(-1)$
  - this implies $f$ is bijective

= Induction
The Fundamental Theorem of Arithmetic (Existence)
- Every natural number $n >= 2$ can be expressed as a product of primes

recursive function definitions
$
sum_(k=1)^n a_k = cases(
  display(sum_(k=1)^0 a_k = 0),
  display(sum_(k=1)^(m+1) a_k = a_(m+1) + sum_(k=1)^m a_k) "if" n = m+1
)
$
$
product_(k=1)^n a_k = cases(
  display(product_(k=1)^0 a_k = 1),
  display(product_(k=1)^(m+1) a_k = a_(m+1) dot product_(k=1)^m a_k) "if" n = m+1
)
$
$
n! = sum_(k=1)^n k
$
weak induction formula
- to prove $forall n in NN$ with $n >= n_0$, $p(n)$:
  - (Base Case) Verify $p(n_0)$ holds
  - (Inductive Step) Verify $forall n >= n_0, p(n) => p(n+1)$

strong induction formula
- to prove $forall n in NN$ with $n >= n_0$, $p(n)$:
  - (Base Case) Verify $p(n_0)$ holds
  - (Inductive Step) Verify $forall n >= n_0,(p(i) "is true for all" i "such that" n_0 <= i <= n) => p(n+1)$

strong induction, multiple base cases formula
- to prove $forall n in NN$ with $n >= n_0$, $p(n)$ with base cases from $n_0$ to $n_1$:
  - (Base Case) Verify all base cases hold
  - (Inductive Step) Verify $forall n >= n_1,(p(i) "is true for all" i "such that" n_0 <= i <= n) => p(n+1)$

= Relations
relation equivalence
- relations $R=S$ iff same domain, codomain, and $forall x,y in X times Y, x R y <=> x S y$

properties of relations (let $R$ be a relation on $X$)
- $R$ is reflexive iff $forall x in X, x R x$
- $R$ is symmetric iff $forall x, y in X, x R y => y R x$
- $R$ is antisymmetric iff $forall x, y in X, x R y and y R x => y = x$
- $R$ is transitive iff $forall x,y,z in X, x R y and y R z => x R z$
- $R$ is an equivalence relation iff $R$ is reflexive, symmetric, and transitive
- $R$ is a partial order iff $R$ is reflexive, antisymmetric, and transitive (may be denoted $lt.curly.eq$)
  - if $lt.curly.eq$ is a partial order of $X$, we say $(X, lt.curly.eq)$ is a poset
- $R$ is total iff $forall x, y in X, (x != y => x R y or y R x)$ (every two distinct elements are relatable)
- $R$ is a total order iff $R$ is a partial order and total

#figure(
  diagram(
    // debug: true,
    spacing: (1em, 1em), 
    node((1,0), $12$, name: <12>),
    node((2,1), $6$, name: <6>),
    node((0,1), $4$, name: <4>),
    node((3,2), $3$, name: <3>),
    node((1,2), $2$, name: <2>),
    node((2,3), $1$, name: <1>),
    edge(<12>, <4>, "-"),
    edge(<12>, <6>, "-"),
    edge(<4>, <2>, "-"),
    edge(<6>, <2>, "-"),
    edge(<6>, <3>, "-"),
    edge(<2>, <1>, "-"),
    edge(<3>, <1>, "-"),
  ),
  caption: [Hasse diagram for the poset $({1,2,3,4,6,12}, divides)$]
)

modular congruence
- let $n "be positive" in ZZ, a,b in ZZ$. then $a equiv b$ (mod $n$) aka $a attach(equiv, br:n) b$ iff $n divides (b-a)$

equivalence class of $a$ under an equivalence relation $tilde$ on X
- $[a]_tilde = {b in X : a tilde b}$
- the set of items related to $a$
- $[a]_tilde = [b]_tilde "iff" a tilde b$

the quotient (letting $tilde$ be an equivalence relation on $X$)
- $X \/ tilde #h(0.25em) = {[a]_tilde : a in X}$
- the collection of all equivalences classes in $X$ under $tilde$

$P$ is a partition of $X$ iff
- $nothing in.not P$
- $forall U,V in P, (U != V => U sect V = nothing)$ i.e. different sets have no elements in common
- $union.big_(U in P) U = X$ i.e. each partition together becomes $P$ 

theorem for equivalence relations/partitions, with a nonempty set $X$
- let $tilde$ be an equivalence relation on $X$. then, $X \/ tilde$ is a partition for $X$
- let $P$ be a partition for $X$. then there exists a unique equivalence relation on $P$ whose quotient is $P$.

= Cardinality 
- $[n] = {1,2,3, ..., n}$
- infinite sets
  - $X$ is finite iff there exists a bijection $f: [n] -> X$ for some natural $n$
  - otherwise, $X$ is infinite
- for finite $X$, then $|X|$ is the natural $n$ where there exists bijective $f: [n]->X$
- let $X,Y$ be finite sets
  - $exists "an injection" f : X -> Y, "then" |X| <= |Y|$
  - $exists "a surjection" f: X -> Y, "then" |X| >= |Y|$
  - $exists "a bijection" f: X-> Y, "then" |X| = |Y|$
  - $"if" A subset.eq X, "then" A "finite and" |A| <= |X|$
  - if $A subset.eq X$, then $A$ finite and $|A| <= |X|$
  - $X sect Y "is finite and" |X sect Y| <= "min"{|X|, |Y|}$
  - $X union Y "is finite and" |X union Y| = |X| + |Y| - |X sect Y|$
  - $X times Y "is finite and" |X times Y| = |X| dot |Y|$
- $X$ is infinitely countable if $exists "a bijection" f: NN -> X$
- $X$ is countable if $X$ is either finite or infinitely countable
- $X$ is uncountable if $X$ is not countable (infinitely or otherwise) 
- if $X$ and $Y$ are countable, then $X times Y$ is countable
- let $X$ be countable
  - if $exists "an injection" f: Y->X$, then $Y$ is countable
  - if $exists "a surjection" f: X->Y$, then $Y$ is countable
  - all $A subset.eq X$ are countable
- diagonalization (prove $X$ uncountable)
  - show that every $f : NN -> X$ is not surjective by finding a $b in X$ that disagrees with $f(n)$ with something involving $n$
- let $X$ be any set
  - $|X| = |Y| "iff" exists "a bijection" f: X-> Y$
  - $|X| <= |Y| "iff" exists "an injection" f: X-> Y$
  - $|X| < |Y| "iff" exists "an injection" f:X -> Y and exists.not "a surjection" g: X -> Y$
- Cantor's: $|X| < |cal(P)(X)|$

#pagebreak()
= Number Theory
- Well Ordering Principle: Any nonempty subset $X subset.eq NN$ has the least element
  - use in "let $n$ be the least element, AFSOC something, wait a minute $m<n$" proofs
- division theorem: Let $a, b in ZZ, b != 0$. There is a quotient and a remainder.
    - (59 and 8? $59=8 dot 7 + 3$)
- let $a,b in ZZ$
  - $c in ZZ$ is a common divisor of $a$ and $b$ if $c$ divides both $a$ and $b$ 
  - $d in ZZ$ is a greatest common divisor of $a$ and $b$ if
    + $d$ divides $a$ and $b$
    + if $c$ is a common divisor of $a$ and $b$, then $c divides d$
  - $a$ and $b$ are coprime iff $gcd(a,b) = 1$
- Euclidean Algorithm
  - lemma: $a = q b + r => gcd(a,b) = gcd(b,r)$
  - let us use an example. find $gcd(148, 40)$.
    $ 
    148 &= 40 dot 3 + 28 \
    40 &= 28 dot 1 + 12 \
    28 &= 12 dot 2 + bold(4) \
    12 &= 4 dot 3 + 0 \
    $

    the last nonzero remainder, 4, is the $gcd$.
- Linear Diophantine Equations
  - Bézout's Lemma: let $a,b,c in ZZ$. the equation $a x + b y = c$ has integer solutions for $x,y$ iff $gcd(a,b) divides c$
  - let us use an example, via the backwards Euclidean Algorithm. find $252x + 198y = 36$.

    we first find $gcd(a,b) = gcd(252,198)$.

    $
    252 &= 198 dot 1 + 54 && "     (1)" \
    198 &= 54 dot 3 + 36 && "     (2)" \
    54 &= 36 dot 1 + 18 && "     (3)" \
    36 &= 18 dot 2 + 0
    $

    Thus, $gcd(252,198) = 18$. Since $18 | 36$, by Bézout's, we have an integer solution. We proceed by backtracking (starting from the most recent iterations).

    $
    18 &= 54 - 36 dot 1 && "(from 3)"\
    18 &= 54 - (198 - 54 dot 3) && "(from 2)"\
    18 &= (252-198) - (198 - (252-198) dot 3) && "(from 1)"\
    18 &= 252 dot 4 - 198 dot 5 \
    36 &= 252 dot 8 - 198 dot 10
    $

    Thus, $x=8$ and $y=-10$.
     
- Multiplicative Inverses Modulo $n$: let $a,n in ZZ$ and $n >= 1$. 
  - we say $a$ has a multiplicative inverse for $a$ modulo $n$ if $a x attach(equiv, br:n) 1$ has an integer solution for $x$. then $x$ is that multiplicative inverse
  - $a$ has a multiplicative inverse modulo $n$ iff $gcd(a,n) = 1$
  - find this inverse similarly to a Linear Dio. Euclidean to get to $gcd=1$ and backsolve.
  - (a normal multiplicative inverse is $a x=1$)

- Divisibility Properties
  - Euclid's Lemma: Let $a,b in ZZ$ and $p$ prime. If $p divides a b$, then $p divides a$ or $p divides b$.
  - $a,b,c in ZZ$. If $c divides a b$ and $gcd(a,c) = 1$, then $c divides b$.
  - every integer $n>=2$ can be expressed as a unique product of positive primes
  - there are infinitely many primes
  - Fermat's little theorem: let $a,p in NN$ with $p$ prime. Then $a^p equiv a " "(mod p)$
    - Corollary: let $a in NN$, $p$ prime with $p divides.not a$. Then $a^(p-1) equiv 1 " " (mod p)$ 
- Bonkers Remainders When Divided by Primes
  - use Fermat's Little Corollary
  - let us use an example. find the remainder of $3^244886$ when divided by $13$.

    by Fermat's, since $13 divides.not 3$, we have $3^12 attach(equiv, br:13) 1$. let us use the power of 12 to simplify $3^244886$. 
    via long division, we have $244886 = 12 dot 20407 + 2$. We proceed.
    $
    3^244886 attach(equiv, br:13) 3^(12 dot 20407 + 2) attach(equiv, br:13) 3^(12 dot 20407) dot 3^2 attach(equiv, br:13) 1 dot 3^2 attach(equiv, br:13) 9
    $
    Thus, the remainder is 9.