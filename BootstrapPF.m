%%  Hasan H�seyin S�nmez - 17.09.2018
%   Bootstrap type Particle filter
%   with sequential importance sampling & resampling (uniform)

%%  Input:  
%           * particles from previous cycle (xk_prev)
%           * new measurements (zk)
%           * PF parameter file (PFparams)
%%  Output:
%           * particles of the new cycle (xk_new).
%           * new particle weights (wk_new).

clc; clearvars; close all;
model = InitParameters;
x0 = 3*randn(model.xDim,model.N);               % initial particles
xk_prev = x0;                                   % initial
zk = 3;

% function [xk_new, wk_new] = BootstrapPF(xk_prev, zk, model)

Ns      = size(xk_prev,2);                              % number of particles
Xki     = SampleParticles(xk_prev, model, qk);          % predicted particles
Wki     = SampleWeights(xki, zk, model);                % predicted weights
wk_pred = Wki/sum(wki);                                 % normalized weights

%% resampling (should be another function)- implement alternative resampling strategies
xk_new = Resampling(Xki, wk_pred, model);               % updated particles
wk_new = ones(1,Ns)/Ns;                                 % new particles (uniform)


% end