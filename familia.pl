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

hoy(18, 12, 1989).

personaje(abe,        18, 12, 1927).
personaje(edwina,     15, 03, 1928).
personaje(mona,       14, 10, 1928).
personaje(gaby,       20, 05, 1932).
personaje(homero,     12, 05, 1956).
personaje(abbie,      13, 11, 1945).
personaje(herbert,    22, 08, 1953).
personaje(jacqueline, 09, 07, 1928).
personaje(clancy,     12, 08, 1927).
personaje(marge,      08, 12, 1955).
personaje(patty,      02, 02, 1953).
personaje(selma,      02, 02, 1953).
personaje(bart,       01, 04, 1979).
personaje(hugo,       01, 04, 1979).
personaje(lisa,       09, 05, 1981).
personaje(maggie,     16, 06, 1988).
personaje(ling,       03, 05, 1988).

estaHarto(Personaje) :-
  tieneHijo(Personaje),
  forall(hijoDe(Hijo, Personaje), joven(Hijo)).

joven(Personaje) :-
  edad(Personaje, Edad),
  Edad < 12.

edad(Personaje, Edad) :-
  personaje(Personaje, DiaP, MesP, AnioP),
  hoy(DiaActual, MesActual, AnioActual),
  edadSegunFechas(DiaP, MesP, AnioP, DiaActual, MesActual, AnioActual, Edad).

edadSegunFechas(_, Mes1, Anio1, _, Mes2, Anio2, Edad) :-
  Anio2 >= Anio1,
  Mes1 > Mes2,
  Edad is Anio2 - Anio1.

edadSegunFechas(Dia1, Mes, Anio1, Dia2, Mes, Anio2, Edad) :-
  Anio2 >= Anio1,
  Dia1 >= Dia2,
  Edad is Anio2 - Anio1.

edadSegunFechas(Dia1, Mes, Anio1, Dia2, Mes, Anio2, Edad) :-
  Anio2 >= Anio1,
  Dia1 < Dia2,
  Edad is Anio2 - Anio1 - 1.

edadSegunFechas(_, Mes1, Anio1, _, Mes2, Anio2, Edad) :-
  Anio2 >= Anio1,
  Mes1 < Mes2,
  Edad is Anio2 - Anio1 - 1.
