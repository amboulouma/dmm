% Master file for Project 1
% Authors: Mohamed Amine Boulouma, Satyam Subhash

clear all;
%% 
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

% C1. Computing the intital steady state of consumption, capital, labor and reporting steady state for wage and rental rate of capital.
P = stst(P);

% A3
% A3_SIR(P);

%% C2. No reaction to outbreak
% P = C2_questions(P);
P

%% C3. Containment measures linked to number of infected
% P = C3_questions(P);
P
%% C4. Containment measures linked to number of susceptibles. Checking the robustness of C3 by changing lambda.
P = C4_questions(P);
P
%% C5. Willingness to pay for a cure and output for testing purposes.
% C5_Analysis(P);


%% C6. Treatment available in period 15
% C6_Analysis(P);
