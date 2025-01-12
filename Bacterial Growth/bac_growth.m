%Simple model representing the bacterial growth
%Diff equation is dn/dt = rn, r is the rate constant, n is the number of bacterial cells

%Define parameters
r = 3

%timespan
t_min = 0
t_max = 3600
t_span = [t_min:t_max]

%Initial conditions
N0 = 60000

%Define ODE System
bac_growth1 = @(t, N)[
    r * N; %dN/dt
]

%Call the function
[t,N] = ode45(bac_growth1, t_span, N0)

%Plot
plot(t, N, '-o', 'DisplayName', 'Bacterial count')
xlabel('Time')
ylabel('Count (Bacteria)')
legend;
title('Bacterial Growth (Linear only)')
grid on;