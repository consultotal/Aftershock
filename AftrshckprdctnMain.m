close all
clear all
clc
% Aftershock prediction framework
%Digital  processing of vibration and shockwave signals 
%%creating SHOCKSAT model: Main file
%units in American system (inches)
prcss=.25;% Model accuracy(inches) = 1/4"

[X1_bb,Y1_bb,Z1_bb,X21_bb,X31_bb,X41_bb,Y21_bb,Y31_bb,Y41_bb,Z211_bb,Z212_bb,Z213_bb]=bttmbx(prcss);% Bottom box
[X1_tb,Y1_tb,Z1_tb,X21_tb,X31_tb,X41_tb,Y21_tb,Y31_tb,Y41_tb,Z211_tb,Z212_tb,Z213_tb]=tpbx(prcss);% Top box
[x_sd,y_sd,z_sd]=SatelliteDish(prcss);% Satellite dish

