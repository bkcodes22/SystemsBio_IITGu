%Simple model representing the bacterial growth
%Diff equation is dn/dt = rn(1-N/K) - (d+alpha)(t)(n)
% It follows Logistic growth accompanied by death rate which increases with a small rate with time

%Define parameters
r = 0.002 %Growth rate
K = 2 %Carrying capacity
d0 = 0.001 % Death rate
alpha = 7e-9

%timespan
t_min = 0
t_max = 30000
t_span = [t_min:1000:t_max]

%Initial conditions
N0 = 0.01

%Define ODE System
bac_growth1 = @(t, N)[
    r * N * (1 - N / K) - (d0 + alpha * t) * N; % dN/dt
]

%Call the function
[t,N] = ode45(bac_growth1, t_span, N0)

%Plot
plot(t, N, '-o', 'DisplayName', 'Bacterial count')
xlabel('Time (Days)')
ylabel('Count (Bacteria)')
legend;
title('Bacterial Growth (Linear only)')
grid on;