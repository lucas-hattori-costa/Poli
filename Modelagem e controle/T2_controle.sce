// T2

t = 0:0.01:10
s = %s

// G(F,x)
num_1 = 0.1573 * s^4 - 3.438*10^-5*s^3 + 9.259*s^2 - 0.0006746*s+116.8
// F(T1, theta1)
num_2 = 2.292*s^4 + 0.0005447*s^3 + 78.36*s^2 + 0.05651*s
// F(T2, theta2)
num_3 = 7.281*s^4 + 0.01002*s^3 + 238.1*s^2 + 0.1695*s

den = s^4 + 3*s^3 + 12*s^2 - 16*s

clear()

// Parametros do sistema
b = 7.12e-3
m = 2
M = 6
g = 9.81
L = 0.5
c = 8.5e-5
dt = 0.1

// Espaco de estados

A_til = [
    [0 1 0 0 0 0],
    [0 -b*L 0 0 0 0],
    [0 0 0 1 0 0],
    [0 0 -3*m*g*L/2 -c -m*g*L/2 0],
    [0 0 0 0 0 1],
    [0 0 0 c -m*g*L/2 -c]
]

B_til = [
    [0 0 0 0 0 0],
    [L 0 0 0 0 0],
    [0 0 0 0 0 0],
    [0 1 0 0 0 0],
    [0 0 0 0 0 0],
    [0 0 1 0 0 0]
]

M = [
    [1 0 0 0 0 0],
    [0 (2*m+M)*L 0 3*m*L^2/2 0 m*L^2/2],
    [0 0 1 0 0 0],
    [0 2*m*L 0 2*m*L^2/2 0 2*m*L^2/3],
    [0 0 0 0 1 0],
    [0 m*L/2 0 m*L^2/6 0 m*L^2/3]
]

A = M' * A_til
B = M' * B_til

C = eye(6,6)
//D = zeros(6,6)

ee = syslin('c',A,B,C)

disp(ss2tf(ee))
