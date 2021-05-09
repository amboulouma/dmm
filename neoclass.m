% Master file for Project 1
% Authors: Mohamed Amine Boulouma, Satyam Subhash

clear all;
close all;
clc;

% initialize P structure
P = struct();

%% Parameterization of the structure
P = pars(P);

% A3
% A3_SIR(P);

% C1. Compute seady state
P = stst(P);

%% C2. No reaction to outbreak
C2_questions(P);
P

%% C3. Containment measures linked to number of infected
%C3_questions(P);

%% C4. Containment measures linked to number of susceptibles
%C4_questions(P);

%% C5. Willingness to pay for a cure
% C5_Analysis(P);


%% C6. Treatment available in period 15
% C6_Analysis(P);
