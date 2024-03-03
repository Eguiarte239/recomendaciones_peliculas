/* Base de hechos sobre peliculas */

% pelicula(Title, Year, Genre, Duration, Country, MainActor, Director)
pelicula(the_matrix, 1999, sci_fi, 136, usa, keanu_reeves, lana_wachowski).
pelicula(pulp_fiction, 1994, crime, 154, usa, john_travolta, quentin_tarantino).
pelicula(fight_club, 1999, drama, 139, usa, brad_pitt, david_fincher).
pelicula(forrest_gump, 1994, drama, 142, usa, tom_hanks, robert_zemeckis).
pelicula(the_shawshank_redemption, 1994, drama, 142, usa, tim_robbins, frank_darabont).
pelicula(the_dark_knight, 2008, action, 152, usa, christian_bale, christopher_nolan).
pelicula(inception, 2010, sci_fi, 148, usa, leonardo_dicaprio, christopher_nolan).
pelicula(titanic, 1997, romance, 195, usa, leonardo_dicaprio, james_cameron).
pelicula(schindlers_list, 1993, biography, 195, usa, liam_neeson, steven_spielberg).
pelicula(gladiator, 2000, action, 155, usa, russell_crowe, ridley_scott).

% Reglas para filtrar peliculas segun el estado de animo
feliz(Pelicula) :- genero(Pelicula, comedia).  % Por ejemplo, comedia para estado de animo feliz
triste(Pelicula) :- genero(Pelicula, drama).   % Por ejemplo, drama para estado de animo triste
normal(Pelicula) :- pelicula(Pelicula, _, _, _, _, _, _).  % Todas las peliculas para estado de animo normal

/* Helper functions */

% Filtra peliculas por genero
pelicula_por_genero(Genre, Peliculas) :-
    findall(Title, pelicula(Title, _, Genre, _, _, _, _), Peliculas).

% Filtra peliculas por ano de lanzamiento
pelicula_por_ano(Year, Peliculas) :-
    findall(Title, pelicula(Title, Year, _, _, _, _, _), Peliculas).

% Filtra peliculas por duracion
pelicula_por_duracion(Duration, Peliculas) :-
    findall(Title, pelicula(Title, _, _, Duration, _, _, _), Peliculas).

% Filtra peliculas por actor principal
pelicula_por_actor(Actor, Peliculas) :-
    findall(Title, pelicula(Title, _, _, _, _, Actor, _), Peliculas).

% Filtra peliculas por director
pelicula_por_director(Director, Peliculas) :-
    findall(Title, pelicula(Title, _, _, _, _, _, Director), Peliculas).

% pelicula_para_estado_animico(EstadoAnimico, Pelicula)
pelicula_para_estado_animico(feliz, Pelicula) :-
    pelicula(Pelicula, _, _, _, _, _, _),   % Obtener todas las peliculas
    feliz(Pelicula).                    % Filtrar peliculas para estado de animo feliz

pelicula_para_estado_animico(triste, Pelicula) :-
    pelicula(Pelicula, _, _, _, _, _, _),   % Obtener todas las peliculas
    triste(Pelicula).                   % Filtrar peliculas para estado de animo triste

pelicula_para_estado_animico(normal, Pelicula) :-
    pelicula(Pelicula, _, _, _, _, _, _),   % Obtener todas las peliculas
    normal(Pelicula).                   % Filtrar peliculas para estado de animo normal

% Peliculas protagonizadas por un actor especifico
peliculas_por_actor(Actor, Peliculas) :-
    findall(Title, pelicula(Title, _, _, _, _, Actor, _), Peliculas).

% Peliculas dirigidas por un director especifico
peliculas_por_director(Director, Peliculas) :-
    findall(Title, pelicula(Title, _, _, _, _, _, Director), Peliculas).

% Recomendar peliculas basadas en las peliculas favoritas del usuario
recomendar_por_peliculas_favoritas(PeliculasFavoritas, Recomendaciones) :-
    findall(Pelicula, (
        member(PeliculaFavorita, PeliculasFavoritas),
        pelicula(Pelicula, _, _, _, _, _, _),
        pelicula_similar(PeliculaFavorita, Pelicula)
    ), Recomendaciones).

% Verificar si dos peliculas son similares (por genero, director, etc.)
pelicula_similar(Pelicula1, Pelicula2) :-
    pelicula(Pelicula1, _, Genero1, _, _, _, Director1),
    pelicula(Pelicula2, _, Genero2, _, _, _, Director2),
    Genero1 == Genero2, Director1 == Director2. % Podrias agregar mas criterios de similitud aqui

% Buscar peliculas por multiples criterios
buscar_peliculas([], Peliculas) :-
    % Si n0 se proporcionan criterios especificos, devolver todas las peliculas
    findall(Pelicula, pelicula(Pelicula, _, _, _, _, _, _), Peliculas).
buscar_peliculas(Criterios, Peliculas) :-
    % Verificar que todos los criterios sean validos
    validar_criterios(Criterios),
    % Buscar peliculas que cumplan con los criterios proporcionados
    findall(Pelicula, (
        pelicula(Pelicula, Year, Genre, Duration, Country, MainActor, Director),
        cumple_criterios(Pelicula, Year, Genre, Duration, Country, MainActor, Director, Criterios)
    ), Peliculas).

% Verificar que todos los criterios sean validos
validar_criterios([]).
validar_criterios([Criterio|Criterios]) :-
    validar_criterio(Criterio),
    validar_criterios(Criterios).

% Verificar si un criterio individual es valido
validar_criterio(year(Year)) :- integer(Year).
validar_criterio(genre(Genre)) :- atom(Genre).
validar_criterio(duration(Duration)) :- integer(Duration).
validar_criterio(country(Country)) :- atom(Country).
validar_criterio(main_actor(Actor)) :- atom(Actor).
validar_criterio(director(Director)) :- atom(Director).
validar_criterio(_) :-
    % Manejar criterios n0 validos
    throw(error('Criterio no valido')).

% Verificar si una pelicula cumple con los criterios de busqueda
cumple_criterios(Pelicula, Year, Genre, Duration, Country, MainActor, Director, Criterios) :-
    member(year(YearCrit), Criterios),
    YearCrit =:= Year,
    member(genre(GenreCrit), Criterios),
    GenreCrit == Genre,
    member(duration(DurationCrit), Criterios),
    DurationCrit == Duration,
    member(country(CountryCrit), Criterios),
    CountryCrit == Country,
    member(main_actor(ActorCrit), Criterios),
    ActorCrit == MainActor,
    member(director(DirectorCrit), Criterios),
    DirectorCrit == Director.

:- dynamic feliz/1, triste/1, normal/1. % Declarar predicados dinamicos

/* Aqui va todo el codigo del sistema experto de recomendacion de peliculas */

% Definir el punto de entrada para iniciar el sistema
start :-
    write('Bienvenido al sistema de recomendacion de peliculas'), nl,
    write('Por favor, ingresa tu estado de animo (feliz, triste, normal): '), nl,
    read(EstadoAnimo),
    recomendar_peliculas_por_estado_animo(EstadoAnimo),
    nl,
    write('Te gustaria buscar peliculas? (si/no): '), nl,
    read(Opcion),
    procesar_opcion(Opcion).

procesar_opcion(si) :-
    menu_helper_functions.
procesar_opcion(no) :-
    write('Espero que disfrutes viendo las peliculas recomendadas'), nl.
procesar_opcion(_) :-
    write('Por favor, ingresa "si" o "no"'), nl,
    read(Opcion),
    procesar_opcion(Opcion).

menu_helper_functions :-
    write('Elige una opcion:'), nl,
    write('1. Filtrar peliculas por genero'), nl,
    write('2. Filtrar peliculas por ano de lanzamiento'), nl,
    write('3. Filtrar peliculas por duracion'), nl,
    write('4. Filtrar peliculas por actor principal'), nl,
    write('5. Filtrar peliculas por director'), nl,
    write('6. Salir'), nl,
    read(Opcion),
    ejecutar_opcion(Opcion).

ejecutar_opcion(1) :-
    write('Generos disponibles: '), nl,
    listar_generos,
    write('Ingresa el genero que deseas buscar: '), nl,
    read(Genre),
    pelicula_por_genero(Genre, Peliculas),
    write('Peliculas encontradas: '), write(Peliculas), nl,
    menu_helper_functions.
ejecutar_opcion(2) :-
    write('Anos de lanzamiento disponibles: '), nl,
    listar_anos,
    write('Ingresa el ano de lanzamiento que deseas buscar: '), nl,
    read(Year),
    pelicula_por_ano(Year, Peliculas),
    write('Peliculas encontradas: '), write(Peliculas), nl,
    menu_helper_functions.
ejecutar_opcion(3) :-
    write('Duraciones disponibles: '), nl,
    listar_duraciones,
    write('Ingresa la duracion que deseas buscar: '), nl,
    read(Duration),
    pelicula_por_duracion(Duration, Peliculas),
    write('Peliculas encontradas: '), write(Peliculas), nl,
    menu_helper_functions.
ejecutar_opcion(4) :-
    write('Actores principales disponibles: '), nl,
    listar_actores,
    write('Ingresa el nombre del actor principal que deseas buscar: '), nl,
    read(Actor),
    pelicula_por_actor(Actor, Peliculas),
    write('Peliculas encontradas: '), write(Peliculas), nl,
    menu_helper_functions.
ejecutar_opcion(5) :-
    write('Directores disponibles: '), nl,
    listar_directores,
    write('Ingresa el nombre del director que deseas buscar: '), nl,
    read(Director),
    pelicula_por_director(Director, Peliculas),
    write('Peliculas encontradas: '), write(Peliculas), nl,
    menu_helper_functions.
ejecutar_opcion(6) :-
    write('Espero que disfrutes viendo las peliculas recomendadas'), nl.
ejecutar_opcion(_) :-
    write('Por favor, ingresa un numero valido'), nl,
    menu_helper_functions.

recomendar_peliculas_por_estado_animo(feliz) :-
    write('Te recomendamos ver comedias para mejorar tu estado de animo').
recomendar_peliculas_por_estado_animo(triste) :-
    write('Te recomendamos ver dramas para sentirte identificado').
recomendar_peliculas_por_estado_animo(normal) :-
    write('Aqui tienes algunas opciones de peliculas para ver').

listar_generos :-
    findall(Genre, pelicula(_, _, Genre, _, _, _, _), Generos),
    list_to_set(Generos, GenerosUnicos),
    imprimir_lista_numerada(GenerosUnicos).

listar_anos :-
    findall(Year, pelicula(_, Year, _, _, _, _, _), Anos),
    list_to_set(Anos, AnosUnicos),
    imprimir_lista_numerada(AnosUnicos).

listar_duraciones :-
    findall(Duration, pelicula(_, _, _, Duration, _, _, _), Duraciones),
    list_to_set(Duraciones, DuracionesUnicas),
    imprimir_lista_numerada(DuracionesUnicas).

listar_actores :-
    findall(Actor, pelicula(_, _, _, _, _, Actor, _), Actores),
    list_to_set(Actores, ActoresUnicos),
    imprimir_lista_numerada(ActoresUnicos).

listar_directores :-
    findall(Director, pelicula(_, _, _, _, _, _, Director), Directores),
    list_to_set(Directores, DirectoresUnicos),
    imprimir_lista_numerada(DirectoresUnicos).

imprimir_lista_numerada(Lista) :-
    imprimir_lista_numerada(Lista, 1).

imprimir_lista_numerada([], _).
imprimir_lista_numerada([Item|Resto], Numero) :-
    write_numero_item(Numero, Item),
    NuevoNumero is Numero + 1,
    imprimir_lista_numerada(Resto, NuevoNumero).

write_numero_item(Numero, Item) :-
    format('~w. ~w~n', [Numero, Item]).