padreDe(abe, abbie).
padreDe(abe, homero).
padreDe(abe, herbert).
padreDe(clancy, marge).
padreDe(clancy, patty).
padreDe(clancy, selma).
padreDe(homero, bart).
padreDe(homero, hugo).
padreDe(homero, lisa).
padreDe(homero, maggie).

madreDe(edwina, abbie).
madreDe(mona, homero).
madreDe(gaby, herbert).
madreDe(jacqueline, marge).
madreDe(jacqueline, patty).
madreDe(jacqueline, selma).
madreDe(marge, bart).
madreDe(marge, hugo).
madreDe(marge, lisa).
madreDe(marge,maggie).
madreDe(selma, ling).

progenitorDe(Progenitor, Hijo) :-
  padreDe(Progenitor, Hijo).

progenitorDe(Progenitor, Hijo) :-
  madreDe(Progenitor, Hijo).

hijoDe(Hijo, Progenitor) :-
  progenitorDe(Progenitor, Hijo).

tieneHijo(Persona) :-
  progenitorDe(Persona, _).

hermanos(Hermano1, Hermano2) :-
  progenitorDe(Progenitor, Hermano1),
  progenitorDe(Progenitor, Hermano2),
  Hermano1 \= Hermano2.
