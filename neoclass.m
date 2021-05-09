% Master file for Project 1
% Authors: Mohamed Amine Boulouma, Satyam Subhash

clear all;
close all;
clc;

% initialize P
P = struct();

%% C1. Parameterization and calibration
% directly set parameters
P = pars(P);

% Steady states
%   iss: 0
%   lss: 1
%   kss: 9.0946
%   css: 1.3206
%   wss: 1.3138
%   rss: 0.0508
%   sss: 1

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
C5_questions(P);

%% C6. Treatment available in period 15
C6_questions(P);

