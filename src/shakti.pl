:- consult('menu.pl').
:- consult('display.pl').
:- consult('logic.pl').
:- consult('utils.pl').
:- use_module(library(system)).
:- use_module(library(random)).
:- use_module(library(lists)).

% Main predicate
play :-
    main_menu.