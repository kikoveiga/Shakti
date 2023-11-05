main_menu :-
    write('   ######  ##     ##    ###    ##    ## ######## ####'), nl, 
    write('  ##    ## ##     ##   ## ##   ##   ##     ##     ## '), nl,  
    write('  ##       ##     ##  ##   ##  ##  ##      ##     ## '), nl, 
    write('   ######  ######### ##     ## #####       ##     ## '), nl,
    write('        ## ##     ## ######### ##  ##      ##     ## '), nl, 
    write('  ##    ## ##     ## ##     ## ##   ##     ##     ## '), nl,
    write('   ######  ##     ## ##     ## ##    ##    ##    #### '), nl, nl,

    write('> 1: Player vs Player'), nl,
    write('> 2: Player vs Computer'), nl,
    write('> 3: Computer vs Computer'), nl,
    write('> 4: Exit'), nl, nl,

    write('Choose your game mode: '), nl,
    read(Mode),
    manage_input(Mode).


manage_input(1) :-
    start_game('P','P').

manage_input(2) :-
    start_game('P','C').

manage_input(3) :-
    start_game('C','C').

manage_input(4) :-
    write('Exiting...'), nl,
    halt.




                                                 


    
