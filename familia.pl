padreDe(abe, homero).
padreDe(homero, bart).
padreDe(homero, lisa).
padreDe(homero, maggie).

madreDe(jacqueline, marge).
madreDe(marge, bart).
madreDe(marge, lisa).
madreDe(marge,maggie).

progenitorDe(Progenitor, Hijo) :- 
  padreDe(Progenitor, Hijo).

progenitorDe(Progenitor, Hijo) :- 
  madreDe(Progenitor, Hijo).

hijoDe(Hijo, Progenitor) :- 
  progenitorDe(Progenitor, Hijo).

tieneHijo(Persona) :- 
  progenitorDe(Persona, _).

hermanos(Hermano1, Hermano2) :-
  Hermano1 \= Hermano2,
  progenitorDe(Progenitor, Hermano1),
  progenitorDe(Progenitor, Hermano2).
