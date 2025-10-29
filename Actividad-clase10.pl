% ===========================
% 1) SIMPLIFICACIÓN SIMBÓLICA
% ===========================

simplifica(E, R) :-
    simplifica1(E, R1),
    ( E == R1 -> R = R1
    ; simplifica(R1, R)
    ).

simplifica1(+(0, X), R) :- simplifica1(X, R).
simplifica1(+(X, 0), R) :- simplifica1(X, R).
simplifica1(*(1, X), R) :- simplifica1(X, R).
simplifica1(*(X, 1), R) :- simplifica1(X, R).
simplifica1(*(0, _), 0).
simplifica1(*(_, 0), 0).

simplifica1(+(A,B), R) :-
    simplifica1(A, SA),
    simplifica1(B, SB),
    reduce_suma(SA, SB, R).
simplifica1(*(A,B), R) :-
    simplifica1(A, SA),
    simplifica1(B, SB),
    reduce_prod(SA, SB, R).

simplifica1(E, E) :- atomic(E).

reduce_suma(0, X, X) :- !.
reduce_suma(X, 0, X) :- !.
reduce_suma(A, B, A+B).

reduce_prod(0, _, 0) :- !.
reduce_prod(_, 0, 0) :- !.
reduce_prod(1, X, X) :- !.
reduce_prod(X, 1, X) :- !.
reduce_prod(A, B, A*B).

% ====================
% 2) DERIVACIÓN BÁSICA
% ====================

derivada(X, X, 1) :- !.
derivada(C, _, 0) :- number(C), !.
derivada(A + B, X, DA + DB) :-
    derivada(A, X, DA),
    derivada(B, X, DB).
derivada(A * B, X, A*DB + B*DA) :-
    derivada(A, X, DA),
    derivada(B, X, DB).
derivada(A - B, X, DA - DB) :-
    derivada(A, X, DA),
    derivada(B, X, DB).

derivada_simplificada(E, X, DS) :-
    derivada(E, X, D),
    simplifica(D, DS).

% ======================
% 3) EVALUACIÓN SIMBÓLICA
% ======================

evalua(X, X, V, V) :- !.
evalua(C, _, _, C) :- number(C), !.
evalua(A + B, X, V, R) :-
    evalua(A, X, V, RA),
    evalua(B, X, V, RB),
    R is RA + RB.
evalua(A * B, X, V, R) :-
    evalua(A, X, V, RA),
    evalua(B, X, V, RB),
    R is RA * RB.
evalua(A - B, X, V, R) :-
    evalua(A, X, V, RA),
    evalua(B, X, V, RB),
    R is RA - RB.

% ===========================
% 4) SUMA Y RESTA DE FRACCIONES
% ===========================

suma(frac(A,B), frac(C,D), frac(Ns, Ms)) :-
    N is A*D + C*B,
    M is B*D,
    mcd(abs(N), abs(M), G),
    Ns is N // G,
    Ms is M // G.

resta(frac(A,B), frac(C,D), frac(Ns, Ms)) :-
    N is A*D - C*B,
    M is B*D,
    mcd(abs(N), abs(M), G),
    Ns is N // G,
    Ms is M // G.

mcd(A, 0, A) :- A =\= 0, !.
mcd(A, B, G) :-
    R is A mod B,
    mcd(B, R, G).

% =============================
% 5) RESOLUCIÓN LINEAL SENCILLA
% =============================

resuelve(X + N = M, X, V) :-
    number(N), number(M),
    V is M - N.

resuelve(N + X = M, X, V) :-
    number(N), number(M),
    V is M - N.

resuelve(X - N = M, X, V) :-
    number(N), number(M),
    V is M + N.

resuelve(N - X = M, X, V) :-
    number(N), number(M),
    V is N - M.

resuelve(A*X + B = C, X, V) :-
    number(A), A =\= 0, number(B), number(C),
    V is (C - B)/A.

resuelve(B + A*X = C, X, V) :-
    number(A), A =\= 0, number(B), number(C),
    V is (C - B)/A.

% =============================
% CONSULTAS
% =============================

% SIMPLIFICACIÓN
% ?- simplifica(*(1, +(0, x)), R).

% DERIVACIÓN
% ?- derivada_simplificada(x*x + 3*x + 2, x, D).

% EVALUACIÓN
% ?- evalua(x*x + 3*x + 2, x, 3, R).

% SUMA Y RESTA DE FRACCIONES
% ?- suma(frac(1,2), frac(1,3), R).

% RESUELVE
% ?- resuelve(2*x + 5 = 15, x, V).