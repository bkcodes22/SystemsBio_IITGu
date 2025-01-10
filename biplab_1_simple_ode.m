%Define parameters
k1 =  0.2
k2 = 0.4

%timespan
t_min = 0;
t_max = 12;
t_span = [t_min:0.1:t_max]

%initial conditions
A0 = 10;
B0 = 20;

%Define ODE System
biplab_1 = @(t,y) [
    -k1 * y(1) + k2 *y(2); %dA/dt
     k1 * y(1) - k2 *y(2); %dB/dt
    ];

%Solve
[t,y] = ode45(biplab_1, t_span, [A0, B0])

%Plotting
figure;
plot(t, y(:,1), '-o', 'DisplayName', 'A(t)');
hold on;
plot(t, y(:,2), '-x', 'DisplayName', 'B(t)');
xlabel("Time (t)");
ylabel("Concentration")
legend;
title('ODE Modelling');
grid on;


