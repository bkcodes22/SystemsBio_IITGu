%Problem definition
%Simple model which includes a reversible chemical reaction between X + 2Y <-> 3P
%Rate constant are given and time for simulation is given along with Initial concentrations of X and Y.
%Differential equations are written with repsect to rate of chnage of X and Y and given as follows. (Written by me)

% Define parameters
k_f = 0.1; % Forward reaction rate constant
k_r = 0.06; % Reverse reaction rate constant

% Initial concentrations
X0 = 2.0; % Initial concentration of X
Y0 = 2.0; % Initial concentration of Y
P0 = 0.0; % Initial concentration of P

% Time span for the simulation
t_span = [0 40]; % Time in arbitrary units

% Define the ODE system
reaction_ode = @(t, C) [
    % d[X]/dt
    -k_f * C(1) * C(2)^2 + k_r * C(3)^3;
    
    % d[Y]/dt
    -2 * k_f * C(1) * C(2)^2 + 2 * k_r * C(3)^3;
    
    % d[P]/dt
    3 * k_f * C(1) * C(2)^2 - 3 * k_r * C(3)^3
];

% Initial concentrations vector
C0 = [X0; Y0; P0];

% Solve the ODE system
[t, C] = ode45(reaction_ode, t_span, C0);

% Extract results
X = C(:, 1); % Concentration of X
Y = C(:, 2); % Concentration of Y
P = C(:, 3); % Concentration of P

% Plot the results
figure;
plot(t, X, '-r', 'DisplayName', '[X]');
hold on;
plot(t, Y, '-b', 'DisplayName', '[Y]');
plot(t, P, '-g', 'DisplayName', '[P]');
xlabel('Time');
ylabel('Concentration');
title('Concentration vs Time for X + 2Y <-> 3P');
legend('show');
grid on;
