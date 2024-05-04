/* Base de hechos sobre películas */

% pelicula(Title, Year, Genre, Duration, Country, MainActor, Director)
pelicula(the_matrix, 1999, sci_fi, media, usa, keanu_reeves, lana_wachowski).
pelicula(pulp_fiction, 1994, crime, larga, usa, john_travolta, quentin_tarantino).
pelicula(fight_club, 1999, drama, media, usa, brad_pitt, david_fincher).
pelicula(forrest_gump, 1994, drama, media, usa, tom_hanks, robert_zemeckis).
pelicula(the_shawshank_redemption, 1994, drama, media, usa, tim_robbins, frank_darabont).
pelicula(the_dark_knight, 2008, action, media, usa, christian_bale, christopher_nolan).
pelicula(inception, 2010, sci_fi, media, usa, leonardo_dicaprio, christopher_nolan).
pelicula(titanic, 1997, romance, larga, usa, leonardo_dicaprio, james_cameron).
pelicula(schindlers_list, 1993, biography, larga, usa, liam_neeson, steven_spielberg).
pelicula(gladiator, 2000, action, media, usa, russell_crowe, ridley_scott).
pelicula(the_silence_of_the_lambs, 1991, thriller, media, usa, jodie_foster, jonathan_demme).
pelicula(seven, 1995, thriller, media, usa, brad_pitt, david_fincher).
pelicula(the_green_mile, 1999, crime, larga, usa, tom_hanks, frank_darabont).
pelicula(the_departed, 2006, crime, media, usa, leonardo_dicaprio, martin_scorsese).
pelicula(saving_private_ryan, 1998, war, larga, usa, tom_hanks, steven_spielberg).
pelicula(the_revenant, 2015, adventure, media, usa, leonardo_dicaprio, alejandro_gonzalez_inarritu).
pelicula(the_wolf_of_wall_street, 2013, biography, larga, usa, leonardo_dicaprio, martin_scorsese).
pelicula(the_prestige, 2006, drama, media, usa, christian_bale, christopher_nolan).
pelicula(the_social_network, 2010, biography, media, usa, jesse_eisenberg, david_fincher).
pelicula(memento, 2000, mystery, corta, usa, guy_pearce, christopher_nolan).
pelicula(shutter_island, 2010, mystery, media, usa, leonardo_dicaprio, martin_scorsese).
pelicula(the_big_lebowski, 1998, comedy, corta, usa, jeff_bridges, joel_coen).
pelicula(trainspotting, 1996, drama, corta, uk, ewan_mcgregor, danny_boyle).
pelicula(lock_stock_and_two_smoking_barrels, 1998, comedy, corta, uk, jason_flemyng, guy_ritchie).
pelicula(snatch, 2000, comedy, corta, uk, brad_pitt, guy_ritchie).
pelicula(braveheart, 1995, biography, larga, usa, mel_gibson, mel_gibson).
pelicula(goodfellas, 1990, biography, media, usa, robert_de_niro, martin_scorsese).
pelicula(leon_the_professional, 1994, crime, corta, france, jean_reno, luc_besson).
pelicula(the_intouchables, 2011, biography, corta, france, francois_cluzet, olivier_nakache).
pelicula(eternal_sunshine_of_the_spotless_mind, 2004, drama, corta, usa, jim_carrey, michel_gondry).
pelicula(la_haine, 1995, drama, corta, france, vincent_cassel, mathieu_kassovitz).
pelicula(amores_perros, 2000, drama, larga, mexico, emilio_echevarria, alejandro_gonzalez_inarritu).
pelicula(y_tu_mama_tambien, 2001, drama, corta, mexico, maribel_verdu, alfonso_cuaron).
pelicula(city_of_god, 2002, crime, media, brazil, alexandre_rodrigues, fernando_meirelles).
pelicula(once_upon_a_time_in_america, 1984, crime, larga, usa, robert_de_niro, sergio_leone).
pelicula(a_clockwork_orange, 1971, crime, media, uk, malcolm_mcdowell, stanley_kubrick).
pelicula(the_godfather, 1972, crime, larga, usa, marlon_brando, francis_ford_coppola).
pelicula(the_godfather_part_ii, 1974, crime, larga, usa, al_pacino, francis_ford_coppola).
pelicula(scarface, 1983, crime, larga, usa, al_pacino, brian_de_palma).
pelicula(raiders_of_the_lost_ark, 1981, action, corta, usa, harrison_ford, steven_spielberg).
pelicula(jurassic_park, 1993, adventure, corta, usa, sam_neill, steven_spielberg).
pelicula(indiana_jones_and_the_last_crusade, 1989, action, corta, usa, harrison_ford, steven_spielberg).
pelicula(star_wars_episode_iv_a_new_hope, 1977, action, corta, usa, mark_hamill, george_lucas).
pelicula(star_wars_episode_v_the_empire_strikes_back, 1980, action, corta, usa, mark_hamill, irvin_kershner).
pelicula(star_wars_episode_vi_return_of_the_jedi, 1983, action, media, usa, mark_hamill, richard_marquand).
pelicula(star_wars_episode_i_the_phantom_menace, 1999, action, media, usa, liam_neeson, george_lucas).
pelicula(star_wars_episode_ii_attack_of_the_clones, 2002, action, media, usa, hayden_christensen, george_lucas).
pelicula(star_wars_episode_iii_revenge_of_the_sith, 2005, action, media, usa, hayden_christensen, george_lucas).
pelicula(taxi_driver, 1976, crime, corta, usa, robert_de_niro, martin_scorsese).
pelicula(american_history_x, 1998, drama, corta, usa, edward_norton, tony_kaye).
/* Helper functions */

% Filtra películas por género
pelicula_por_genero(Genre, Peliculas) :-
    findall(Title, pelicula(Title, _, Genre, _, _, _, _), Peliculas).

% Filtra películas por duración
pelicula_por_duracion(Duracion, Peliculas) :-
    findall(Title, pelicula(Title, _, _, Duracion, _, _, _), Peliculas).

% Filtra películas por actor
peliculas_por_actor(Actor, Peliculas) :-
    findall(Title, pelicula(Title, _, _, _, _, Actor, _), Peliculas).

% Filtra películas por director
peliculas_por_director(Director, Peliculas) :-
    findall(Title, pelicula(Title, _, _, _, _, _, Director), Peliculas).

start :-
    write('Bienvenido al sistema de recomendacion de peliculas'), nl,
    menu_generos.

menu_generos :-
    listar_generos_con_preguntas.

listar_generos_con_preguntas :-
    findall(Genre, pelicula(_, _, Genre, _, _, _, _), ListaGeneros),
    list_to_set(ListaGeneros, GenerosUnicos),
    listar_generos_con_preguntas(GenerosUnicos, 1, []).

listar_generos_con_preguntas([], _, _).
listar_generos_con_preguntas([Genero|Resto], Numero, GenerosSeleccionados) :-
    \+ member(Genero, GenerosSeleccionados),
    atomic_list_concat(['Te gustan las peliculas de ', Genero, '? (si/no): '], Pregunta),
    write(Numero), write('. '), write(Pregunta), nl,
    read(Respuesta),
    (
        Respuesta == si ->
            pelicula_por_genero(Genero, Peliculas),
            union(GenerosSeleccionados, [Genero], NuevosGeneros),
            menu_duraciones(Peliculas, NuevosGeneros)
        ;
            NuevoNumero is Numero + 1,
            listar_generos_con_preguntas(Resto, NuevoNumero, GenerosSeleccionados)
    ).

menu_duraciones(Peliculas, GenerosSeleccionados) :-
    listar_duraciones(Peliculas, GenerosSeleccionados).

listar_duraciones(Peliculas, GenerosSeleccionados) :-
    listar_duraciones(Peliculas, GenerosSeleccionados, 1, []).

listar_duraciones([], _, _, _).
listar_duraciones([Pelicula|Resto], GenerosSeleccionados, Numero, DuracionesSeleccionadas) :-
    pelicula(Pelicula, _, _, Duracion, _, _, _),
    \+ member(Duracion, DuracionesSeleccionadas),
    atomic_list_concat(['Te gustan las peliculas de duración ', Duracion, '? (si/no): '], Pregunta),
    write(Numero), write('. '), write(Pregunta), nl,
    read(Respuesta),
    (
        Respuesta == si ->
            pelicula_por_duracion(Duracion, PeliculasFiltradas),
            peliculas_por_generos_y_duracion(PeliculasFiltradas, GenerosSeleccionados, Duracion, PeliculasIntersectadas),
            menu_directores(PeliculasIntersectadas, Duracion, GenerosSeleccionados)
        ;
            NuevoNumero is Numero + 1,
            listar_duraciones(Resto, GenerosSeleccionados, NuevoNumero, DuracionesSeleccionadas)
    ).

peliculas_por_generos_y_duracion([], _, _, []).
peliculas_por_generos_y_duracion([Pelicula|Resto], Generos, Duracion, [Pelicula|Result]) :-
    pelicula(Pelicula, _, Genre, Duracion, _, _, _),
    member(Genre, Generos),
    peliculas_por_generos_y_duracion(Resto, Generos, Duracion, Result).
peliculas_por_generos_y_duracion([_|Resto], Generos, Duracion, Result) :-
    peliculas_por_generos_y_duracion(Resto, Generos, Duracion, Result).

menu_directores(Peliculas, Duracion, GenerosSeleccionados) :-
    listar_directores(Peliculas, Duracion, GenerosSeleccionados).

listar_directores(Peliculas, Duracion, GenerosSeleccionados) :-
    listar_directores(Peliculas, Duracion, GenerosSeleccionados, 1, []).

listar_directores([], _, _, _).
listar_directores([Pelicula|Resto], Duracion, GenerosSeleccionados, Numero, DirectoresSeleccionados) :-
    pelicula(Pelicula, _, _, Duracion, _, _, Director),
    \+ member(Director, DirectoresSeleccionados),
    atomic_list_concat(['Te gustan las peliculas de ', Director, '? (si/no): '], Pregunta),
    write(Numero), write('. '), write(Pregunta), nl,
    read(Respuesta),
    (
        Respuesta == si ->
            peliculas_por_director(Director, PeliculasFiltradas),
            peliculas_por_generos_y_duracion(PeliculasFiltradas, GenerosSeleccionados, Duracion, PeliculasIntersectadas),
            menu_actores(PeliculasIntersectadas, Duracion, Director, DirectoresSeleccionados, GenerosSeleccionados)
        ;
            NuevoNumero is Numero + 1,
            listar_directores(Resto, Duracion, GenerosSeleccionados, NuevoNumero, DirectoresSeleccionados)
    ).

menu_actores(Peliculas, Duracion, Director, DirectoresSeleccionados, GenerosSeleccionados) :-
    listar_actores(Peliculas, Duracion, Director, DirectoresSeleccionados, GenerosSeleccionados).

listar_actores(Peliculas, Duracion, Director, DirectoresSeleccionados, GenerosSeleccionados) :-
    listar_actores(Peliculas, Duracion, Director, DirectoresSeleccionados, GenerosSeleccionados, 1, []).

listar_actores([], _, _, _, _, _, _).
listar_actores([Pelicula|Resto], Duracion, Director, DirectoresSeleccionados, GenerosSeleccionados, Numero, ActoresSeleccionados) :-
    pelicula(Pelicula, _, _, Duracion, _, Actor, _),
    \+ member(Actor, ActoresSeleccionados),
    atomic_list_concat(['Te gustan las peliculas protagonizadas por ', Actor, '? (si/no): '], Pregunta),
    write(Numero), write('. '), write(Pregunta), nl,
    read(Respuesta),
    (
        Respuesta == si ->
            peliculas_por_actor(Actor, PeliculasPorActor),
            peliculas_por_generos_y_duracion(PeliculasPorActor, GenerosSeleccionados, Duracion, PeliculasFiltradas),
            recomendar_pelicula(PeliculasFiltradas)
        ;
            NuevoNumero is Numero + 1,
            listar_actores(Resto, Duracion, Director, DirectoresSeleccionados, GenerosSeleccionados, NuevoNumero, ActoresSeleccionados)
    ).

recomendar_pelicula(Peliculas) :-
    length(Peliculas, NumPeliculas),
    (
        NumPeliculas > 0 ->
            random_member(PeliculaRecomendada, Peliculas),
            write('Te recomiendo la pelicula: '), write(PeliculaRecomendada), nl
        ;
            write('Lo siento, no puedo recomendarte ninguna pelicula con los criterios seleccionados'), nl
    ).