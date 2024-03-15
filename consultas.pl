/* Base de hechos sobre películas */

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
pelicula(the_silence_of_the_lambs, 1991, thriller, 118, usa, jodie_foster, jonathan_demme).
pelicula(seven, 1995, thriller, 127, usa, brad_pitt, david_fincher).
pelicula(the_green_mile, 1999, crime, 189, usa, tom_hanks, frank_darabont).
pelicula(the_departed, 2006, crime, 151, usa, leonardo_dicaprio, martin_scorsese).
pelicula(saving_private_ryan, 1998, war, 169, usa, tom_hanks, steven_spielberg).
pelicula(the_revenant, 2015, adventure, 156, usa, leonardo_dicaprio, alejandro_gonzalez_inarritu).
pelicula(the_wolf_of_wall_street, 2013, biography, 180, usa, leonardo_dicaprio, martin_scorsese).
pelicula(the_prestige, 2006, drama, 130, usa, christian_bale, christopher_nolan).
pelicula(the_social_network, 2010, biography, 120, usa, jesse_eisenberg, david_fincher).
pelicula(memento, 2000, mystery, 113, usa, guy_pearce, christopher_nolan).
pelicula(shutter_island, 2010, mystery, 138, usa, leonardo_dicaprio, martin_scorsese).
pelicula(the_big_lebowski, 1998, comedy, 117, usa, jeff_bridges, joel_coen).
pelicula(trainspotting, 1996, drama, 94, uk, ewan_mcgregor, danny_boyle).
pelicula(lock_stock_and_two_smoking_barrels, 1998, comedy, 107, uk, jason_flemyng, guy_ritchie).
pelicula(snatch, 2000, comedy, 104, uk, brad_pitt, guy_ritchie).
pelicula(braveheart, 1995, biography, 178, usa, mel_gibson, mel_gibson).
pelicula(goodfellas, 1990, biography, 146, usa, robert_de_niro, martin_scorsese).
pelicula(leon_the_professional, 1994, crime, 110, france, jean_reno, luc_besson).
pelicula(the_intouchables, 2011, biography, 112, france, francois_cluzet, olivier_nakache).
pelicula(eternal_sunshine_of_the_spotless_mind, 2004, drama, 108, usa, jim_carrey, michel_gondry).
pelicula(la_haine, 1995, drama, 98, france, vincent_cassel, mathieu_kassovitz).
pelicula(amores_perros, 2000, drama, 154, mexico, emilio_echevarria, alejandro_gonzalez_inarritu).
pelicula(y_tu_mama_tambien, 2001, drama, 106, mexico, maribel_verdu, alfonso_cuaron).
pelicula(city_of_god, 2002, crime, 130, brazil, alexandre_rodrigues, fernando_meirelles).
pelicula(once_upon_a_time_in_america, 1984, crime, 229, usa, robert_de_niro, sergio_leone).
pelicula(a_clockwork_orange, 1971, crime, 136, uk, malcolm_mcdowell, stanley_kubrick).
pelicula(the_godfather, 1972, crime, 175, usa, marlon_brando, francis_ford_coppola).
pelicula(the_godfather_part_ii, 1974, crime, 202, usa, al_pacino, francis_ford_coppola).
pelicula(scarface, 1983, crime, 170, usa, al_pacino, brian_de_palma).
pelicula(raiders_of_the_lost_ark, 1981, action, 115, usa, harrison_ford, steven_spielberg).
pelicula(jurassic_park, 1993, adventure, 127, usa, sam_neill, steven_spielberg).
pelicula(indiana_jones_and_the_last_crusade, 1989, action, 127, usa, harrison_ford, steven_spielberg).
pelicula(star_wars_episode_iv_a_new_hope, 1977, action, 121, usa, mark_hamill, george_lucas).
pelicula(star_wars_episode_v_the_empire_strikes_back, 1980, action, 124, usa, mark_hamill, irvin_kershner).
pelicula(star_wars_episode_vi_return_of_the_jedi, 1983, action, 131, usa, mark_hamill, richard_marquand).
pelicula(star_wars_episode_i_the_phantom_menace, 1999, action, 136, usa, liam_neeson, george_lucas).
pelicula(star_wars_episode_ii_attack_of_the_clones, 2002, action, 142, usa, hayden_christensen, george_lucas).
pelicula(star_wars_episode_iii_revenge_of_the_sith, 2005, action, 140, usa, hayden_christensen, george_lucas).
pelicula(taxi_driver, 1976, crime, 113, usa, robert_de_niro, martin_scorsese).
pelicula(american_history_x, 1998, drama, 119, usa, edward_norton, tony_kaye).

/* Helper functions */

% Filtra películas por género
pelicula_por_genero(Genre, Peliculas) :-
    findall(Title, pelicula(Title, _, Genre, _, _, _, _), Peliculas).

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
    findall(Genre, pelicula(_, _, Genre, _, _, _, _), Generos),
    listar_generos_con_preguntas(Generos, 1, []).

listar_generos_con_preguntas([], _, _) :-
    write('Lo siento, no puedo recomendarte ninguna película con los criterios seleccionados'), nl.
listar_generos_con_preguntas([Genero|Resto], Numero, GenerosSeleccionados) :-
    atomic_list_concat(['Te gustan las peliculas de ', Genero, '? (si/no): '], Pregunta),
    write(Numero), write('. '), write(Pregunta), nl,
    read(Respuesta),
    (
        Respuesta == si ->
            pelicula_por_genero(Genero, Peliculas),
            union(GenerosSeleccionados, [Genero], NuevosGeneros),
            menu_directores(Peliculas, NuevosGeneros)
        ;
            NuevoNumero is Numero + 1,
            listar_generos_con_preguntas(Resto, NuevoNumero, GenerosSeleccionados)
    ).

menu_directores(Peliculas, GenerosSeleccionados) :-
    listar_directores(Peliculas, GenerosSeleccionados).

listar_directores(Peliculas, GenerosSeleccionados) :-
    listar_directores(Peliculas, GenerosSeleccionados, 1).

listar_directores([], _, _).
listar_directores([Pelicula|Resto], GenerosSeleccionados, Numero) :-
    pelicula(Pelicula, _, _, _, _, _, Director),
    atomic_list_concat(['Te gustan las peliculas de ', Director, '? (si/no): '], Pregunta),
    write(Numero), write('. '), write(Pregunta), nl,
    read(Respuesta),
    (
        Respuesta == si ->
            peliculas_por_director(Director, PeliculasFiltradas),
            peliculas_por_generos(PeliculasFiltradas, GenerosSeleccionados, PeliculasIntersectadas),
            menu_actores(PeliculasIntersectadas, GenerosSeleccionados)
        ;
            NuevoNumero is Numero + 1,
            listar_directores(Resto, GenerosSeleccionados, NuevoNumero)
    ).

peliculas_por_generos([], _, []).
peliculas_por_generos([Pelicula|Resto], Generos, [Pelicula|Result]) :-
    pelicula(Pelicula, _, Genre, _, _, _, _),
    member(Genre, Generos),
    peliculas_por_generos(Resto, Generos, Result).
peliculas_por_generos([_|Resto], Generos, Result) :-
    peliculas_por_generos(Resto, Generos, Result).

menu_actores(Peliculas, GenerosSeleccionados) :-
    listar_actores(Peliculas, GenerosSeleccionados).

listar_actores(Peliculas, GenerosSeleccionados) :-
    listar_actores(Peliculas, GenerosSeleccionados, 1).

listar_actores([], _).
listar_actores([Pelicula|Resto], GenerosSeleccionados, Numero) :-
    pelicula(Pelicula, _, _, _, _, Actor, _),
    atomic_list_concat(['Te gustan las peliculas protagonizadas por ', Actor, '? (si/no): '], Pregunta),
    write(Numero), write('. '), write(Pregunta), nl,
    read(Respuesta),
    (
        Respuesta == si ->
            peliculas_por_actor(Actor, PeliculasPorActor),
            peliculas_por_generos(PeliculasPorActor, GenerosSeleccionados, PeliculasFiltradas),
            recomendar_pelicula(PeliculasFiltradas)
        ;
            NuevoNumero is Numero + 1,
            listar_actores(Resto, GenerosSeleccionados, NuevoNumero)
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