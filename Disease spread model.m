%Disease model
% 1. Disease spreads when an infected person comes in contact with the uniinfected person
% 2. No one gets cured
% 3. Everybody can come in contact with everyone
% 4. Total population is large
% 5. Total population remains constant i.e there is no birth and death.
% Differential equations - dx/dt = rx(1-x)
% x is infected population then 1-x is population which is not infected and r is the rate constant for spreading the disease.

%initial value Xo is 0.02 and r is 0.5

%Define parameters
r = 0.5

%Initial concentartion
X0 = 0.02

%Time
t_min = 0
t_max = 30
t_span = [t_min:1:t_max]

%Define ODE System
model2 = @(t,x) [
    r * x * (1-x);
]

%Call ODEs
[t,x] = ode45(model2, t_span, X0)

%Plot
plot(t, x, '-o', 'DisplayName', 'Disease Spread')
xlabel('Time')
ylabel('Fraction of population infected')
legend;
title('Disease Modeling')
grid on;