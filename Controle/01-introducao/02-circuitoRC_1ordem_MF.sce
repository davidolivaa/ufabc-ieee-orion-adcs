//circuito RC em malha aberta

//valores do resistor e capacitor
R = 20e3; C = 10e-6;

//funçao poly cria polinomios a partir de 3 parametros
numerador = poly([1], 's', 'c')
denominador = poly([1 R*C], 's', 'c')

//funçao syslin vai criar a funçao de transferencia em malha aberta
P_s = syslin('c', numerador, denominador)
disp('FT malha aberta', P_s)

//cria a funçao de transferencia do controlador
C_s = poly([3], 's', 'c')

//cria a funçao de transferencia do sensor
H_s = poly([1], 's', 'c')

//cria a funçao de transferencia em malha fechada
G1_s = (C_s*P_s)/(1+C_s*P_s*H_s)
disp('FT malha fechada', G1_s)

// tempos criados com a funçao linspace que cria vetores, esses tempos serao usados como parametros para encontrar a resposta ao degrau
t = linspace(0, 1, 1e3); t1 = linspace(-0.2, 1, 1e3) // degrau unitario
y_degrau = [0*t1(t1<=0)t1(t1>0)./t1(t1>0)] //cria o grafico para o degrau, 0 quando t1 é menor que 0 e t1 quando é maior
y_sistema = csim('step', t, G1_s) // funçao que calcula a resposta ao degrau

scf(1); clf(1); //comando que faz os dois graficos ficarem na mesma figura

plot(t1, y_degrau, 'r-', 'LineWidth', 3); plot(t, y_sistema, 'b-', 'LineWidth', 3)

title "Circuito RC em malha fechada" fontsize 5
xlabel "$tempo (s)$" fontsize 5
ylabel "$V \ (V)$" fontsize 5

L=legend(['degrau unitario', 'resposta ao degrau'], 'font_size', 4, 4)
L.font_size=4

set(gca(), 'font_size', 5)
set(gca(), 'grid', [1 1])
set(gca(), 'data_bounds', [-0.01 -0.01; 1 1.1])
