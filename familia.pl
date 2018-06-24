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
  compartenPadre(Hermano1, Hermano2),
  compartenMadre(Hermano1, Hermano2).

compartenPadre(Hermano1, Hermano2) :-
  padreDe(Padre, Hermano1),
  padreDe(Padre, Hermano2),
  Hermano1 \= Hermano2.

compartenMadre(Hermano1, Hermano2) :-
  madreDe(Madre, Hermano1),
  madreDe(Madre, Hermano2),
  Hermano1 \= Hermano2.

medioHermanos(Hermano1, Hermano2) :-
  compartenPadre(Hermano1, Hermano2),
  not(compartenMadre(Hermano1, Hermano2)).

medioHermanos(Hermano1, Hermano2) :-
  compartenMadre(Hermano1, Hermano2),
  not(compartenPadre(Hermano1, Hermano2)).

% Las edades de los simpson se calculan como si la fecha actual fuese (18 de diciembre de 1989)

edad(abe, 62).         % 18 de Diciembre de 1927
edad(edwina, 61).      % 15 de Marzo de 1928.
edad(mona, 61).        % 14 de Octubre de 1928.
edad(gaby, 57).        % 20 de Mayo de 1932.
edad(homero, 33).      % 12 de Mayo de 1956.
edad(abbie, 44).       % 13 de Noviembre de 1945.
edad(herbert, 36).     % 22 de Agosto de 1953.
edad(jacqueline, 61).  % 09 de Julio de 1928.
edad(clancy, 62).      % 12 de Agosto de 1927.
edad(marge, 34).       % 08 de Diciembre de 1955.
edad(patty, 36).       % 02 de Febrero de 1953.
edad(selma, 36).       % 02 de Febrero de 1953.
edad(bart, 10).        % 01 de Abril de 1979.
edad(hugo, 10).        % 01 de Abril de 1979.
edad(lisa, 08).        % 09 de Mayo de 1981.
edad(maggie, 01).      % 16 de Junio de 1988.
edad(ling, 01).        % 03 de mayo de 1988.

estaHarto(Personaje) :-
  tieneHijo(Personaje),
  forall(hijoDe(Hijo, Personaje), joven(Hijo)).

joven(Personaje) :-
  edad(Personaje, Edad),
  Edad < 12.
