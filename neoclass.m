% Master file for Project 1
% Author: Martin Kerndler

clear all;
%% 
close all;
clc;

% initialize P
P = struct();

%% C1. Parameterization and calibration
% directly set parameters
P = pars(P);

% C1. Compute seady state
P = stst(P);

% A3
A3_SIR(P);

%% C2. No reaction to outbreak
C2_questions(P);

%% C3. Containment measures linked to number of infected
C3_questions(P);

%% C4. Containment measures linked to number of susceptibles
C4_questions(P);

%% C5. Willingness to pay for a cure
% C5_Analysis(P);


%% C6. Treatment available in period 15
% C6_Analysis(P);