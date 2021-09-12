clear

//Sistema mecanico, massa-mola-amortecedor em PID

T_sim = 10; //tempo de simulaçao

//valores das variaveis de massa, força viscosa e Kmola
Massa = 0.1; Fviscosa = 0.2; Kmola = 1.6;

//calcula eta e wn
Wn = sqrt(Kmola/Massa);
eta = (Fviscosa/Massa)/(2*Wn);
disp('Wn e eta', [Wn eta]);

//funçao poly cria polinomios a partir de 3 parametros
numerador = poly([1], 's', 'c');
denominador = poly([Kmola Fviscosa Massa], 's', 'c');

//funçao syslin vai criar a funçao de transferencia em malha aberta
P_s = syslin('c', numerador, denominador);
disp('FT malha aberta', P_s);

//funçao transferencia controlador PID
ki = 2*Wn; kp = 10*Wn; kd = 1*Wn;
C_s = syslin('c', poly([ki kp kd], 's', 'c'), poly([0 1], 's', 'c'));
disp('FT controlador', C_s);

//cria a funçao de transferencia do sensor
H_s = poly([1], 's', 'c');

//cria a funçao de transferencia em malha fechada
G1_s = (C_s*P_s)/(1+C_s*P_s*H_s);
disp('FT malha fechada', G1_s);

// tempos criados com a funçao linspace que cria vetores, esses tempos serao usados como parametros para encontrar a resposta ao degrau
t = linspace(0, T_sim, 1e4); t1 = linspace(-1, T_sim, 1e4); // degrau unitario
y_degrau = [0*t1(t1<=0)t1(t1>0)./t1(t1>0)]; //cria o grafico do degrau, 0 quando t1 é menor que 0 e t1 quando é maior
y_sis_MA = csim('step', t, P_s); // funçao que calcula a resposta ao degrau
y_sis_MF = csim('step', t, G1_s); // funçao que calcula a resposta ao degrau

scf(3); clf(3); //comando que faz os dois graficos ficarem na mesma figura

plot(t1, y_degrau, 'r-', 'LineWidth', 3); 
plot(t, y_sis_MA, 'b-', 'LineWidth', 3); 
plot(t, y_sis_MF, 'k-', 'LineWidth', 3);

title "Sistema massa mola amortecedor com PID" fontsize 5;
xlabel "$tempo (s)$" fontsize 5;
ylabel "$V \ (V)$" fontsize 5;

L=legend(['degrau unitario', 'resposta em malha aberta', 'resposta em malha fechada'], 'font_size', 4, 4);
L.font_size=4;

set(gca(), 'font_size', 5);
set(gca(), 'grid', [1 1]);
set(gca(), 'data_bounds', [-0.01 -0.01; 1 1.1]);
