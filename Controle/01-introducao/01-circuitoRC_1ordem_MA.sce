//circuito RC em malha aberta

//valores do resistor e capacitor
R = 1; 
C = 1;

//funçao poly cria polinomios a partir de 3 parametros
numerador = poly([1], 's', 'c')
denominador = poly([1 R*C], 's', 'c')

//funçao syslin vai criar a funçao de transferencia
Hma = syslin('c', numerador, denominador)
disp('FT malha aberta', Hma)

// tempos criados com a funçao linspace que cria vetores, esses tempos serao usados como parametros para encontrar a resposta ao degrau
t = linspace(0, 10, 1e3) // resposta ao degrau
t1 = linspace(-2, 10, 1e3) // degrau unitario
y_degrau = [0*t1(t1<=0)t1(t1>0)./t1(t1>0)] //cria o grafico para o degrau, 0 quando t1 é menor que 0 e t1 quando é maior
y_sistema = csim('step', t, Hma) // funçao que calcula a resposta ao degrau

scf(1); clf(1); //comando que faz os dois graficos ficarem na mesma figura

plot(t1, y_degrau, 'r-', 'LineWidth', 3)
plot(t, y_sistema, 'b-', 'LineWidth', 3)

title "Circuito RC em malha aberta" fontsize 5
xlabel "$tempo (s)$" fontsize 5
ylabel "$V \ (V)$" fontsize 5

L=legend(['degrau unitario', 'resposta ao degrau'], 'font_size', 4, 4)
L.font_size=4

set(gca(), 'font_size', 5)
set(gca(), 'grid', [1 1])
set(gca(), 'data_bounds', [-0.01 -0.01; 10 1.1])
