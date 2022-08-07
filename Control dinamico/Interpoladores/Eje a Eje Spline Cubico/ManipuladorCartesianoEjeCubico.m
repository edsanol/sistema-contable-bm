function [Y1] = ManipuladorCartesianoEjeCubico(S1, S2, S3, S4, S5, S6, D2, Q3, Q4, Q5, Q6, N)
%ManipuladorCartesiano 
%   Simulación Eje a Eje 
%   DENAVIT - Cinematica Directa
% V1=[   180,  D1,   0, -90];
% V2=[    90,  D2,   0,  90];
% V3=[T3+180,  L3,   0,  90];
% V4=[ T4-90,   0, -L4,   0];
% V5=[    T5,   0, -L5,   0];
% V6=[    T6,   0, -L6,   0];

%Articulacion 1

for e=2:1:N
    d1 = S1(e);
    d2 = D2;
    q3 = Q3;
    q4 = Q4;
    q5 = Q5;
    q6 = Q6;
    
V1=[    180,   d1,     0, -90];
V2=[     90,   d2,     0,  90];
V3=[ q3+180,    3,     0,  90];
V4=[  q4-90,    0, -12.5,   0];
V5=[     q5,    0, -15.5,   0];
V6=[     q6,    0,  -5.7,   0];

A1=[cosd(V1(1)), -cosd(V1(4))*sind(V1(1)),  sind(V1(4))*sind(V1(1)), V1(3)*cosd(V1(1));
    sind(V1(1)),  cosd(V1(4))*cosd(V1(1)), -sind(V1(4))*cosd(V1(1)), V1(3)*sind(V1(1));
              0,              sind(V1(4)),              cosd(V1(4)),             V1(2);
              0,                        0,                        0,                1];
A2=[cosd(V2(1)), -cosd(V2(4))*sind(V2(1)),  sind(V2(4))*sind(V2(1)), V2(3)*cosd(V2(1));
    sind(V2(1)),  cosd(V2(4))*cosd(V2(1)), -sind(V2(4))*cosd(V2(1)), V2(3)*sind(V2(1));
              0,              sind(V2(4)),              cosd(V2(4)),             V2(2);
              0,                        0,                        0,                1];
A3=[cosd(V3(1)), -cosd(V3(4))*sind(V3(1)),  sind(V3(4))*sind(V3(1)), V3(3)*cosd(V3(1));
    sind(V3(1)),  cosd(V3(4))*cosd(V3(1)), -sind(V3(4))*cosd(V3(1)), V3(3)*sind(V3(1));
              0,              sind(V3(4)),              cosd(V3(4)),             V3(2);
              0,                        0,                        0,                1];
A4=[cosd(V4(1)), -cosd(V4(4))*sind(V4(1)),  sind(V4(4))*sind(V4(1)), V4(3)*cosd(V4(1));
    sind(V4(1)),  cosd(V4(4))*cosd(V4(1)), -sind(V4(4))*cosd(V4(1)), V4(3)*sind(V4(1));
              0,              sind(V4(4)),              cosd(V4(4)),             V4(2);
              0,                        0,                        0,                1];
A5=[cosd(V5(1)), -cosd(V5(4))*sind(V5(1)),  sind(V5(4))*sind(V5(1)), V5(3)*cosd(V5(1));
    sind(V5(1)),  cosd(V5(4))*cosd(V5(1)), -sind(V5(4))*cosd(V5(1)), V5(3)*sind(V5(1));
              0,              sind(V5(4)),              cosd(V5(4)),             V5(2);
              0,                        0,                        0,                1];
A6=[cosd(V6(1)), -cosd(V6(4))*sind(V6(1)),  sind(V6(4))*sind(V6(1)), V6(3)*cosd(V6(1));
    sind(V6(1)),  cosd(V6(4))*cosd(V6(1)), -sind(V6(4))*cosd(V6(1)), V6(3)*sind(V6(1));
              0,              sind(V6(4)),              cosd(V6(4)),             V6(2);
              0,                        0,                        0,                1];

M2=A1*A2;
M3=A1*A2*A3;
M4=A1*A2*A3*A4;
M5=A1*A2*A3*A4*A5;
Z=A1*A2*A3*A4*A5*A6;

figure(1);
pause(0.00001);
frame_h = get(handle(gcf),'JavaFrame');
set(frame_h,'Maximized',1);

Y1=plot3([0,A1(1,4)],[0,A1(2,4)],[0,A1(3,4)]);
hold on
SX0 = plot3([0 1],[0 0],[0 0],'red','LineStyle','--','LineWidth',1);
SY0 = plot3([0,0],[0,1],[0,0],'green','LineStyle','--','LineWidth',1);
SZ0 = plot3([0,0],[0,0],[0,1],'blue','LineStyle','--','LineWidth',1);
plot3([0,A1(1,4)],[0,A1(2,4)],[0,A1(3,4)])
hold on
SX1 = plot3([A1(1,4) A1(1,4)+A1(1,1)],[A1(2,4) A1(2,4)+A1(2,1)],[A1(3,4) A1(3,4)+A1(3,1)],'red','LineStyle','--','LineWidth',1);
SY1 = plot3([A1(1,4) A1(1,4)+A1(1,2)],[A1(2,4) A1(2,4)+A1(2,2)],[A1(3,4) A1(3,4)+A1(3,2)],'green','LineStyle','--','LineWidth',1);
SZ1 = plot3([A1(1,4) A1(1,4)+A1(1,3)],[A1(2,4) A1(2,4)+A1(2,3)],[A1(3,4) A1(3,4)+A1(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([A1(1,4), M2(1,4)],[A1(2,4),M2(2,4)],[A1(3,4),M2(3,4)])
hold on
SX2 = plot3([M2(1,4) M2(1,4)+M2(1,1)],[M2(2,4) M2(2,4)+M2(2,1)],[M2(3,4) M2(3,4)+M2(3,1)],'red','LineStyle','--','LineWidth',1);
SY2 = plot3([M2(1,4) M2(1,4)+M2(1,2)],[M2(2,4) M2(2,4)+M2(2,2)],[M2(3,4) M2(3,4)+M2(3,2)],'green','LineStyle','--','LineWidth',1);
SZ2 = plot3([M2(1,4) M2(1,4)+M2(1,3)],[M2(2,4) M2(2,4)+M2(2,3)],[M2(3,4) M2(3,4)+M2(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([M2(1,4), M3(1,4)],[M2(2,4),M3(2,4)],[M2(3,4),M3(3,4)])
hold on
SX3 = plot3([M3(1,4) M3(1,4)+M3(1,1)],[M3(2,4) M3(2,4)+M3(2,1)],[M3(3,4) M3(3,4)+M3(3,1)],'red','LineStyle','--','LineWidth',1);
SY3 = plot3([M3(1,4) M3(1,4)+M3(1,2)],[M3(2,4) M3(2,4)+M3(2,2)],[M3(3,4) M3(3,4)+M3(3,2)],'green','LineStyle','--','LineWidth',1);
SZ3 = plot3([M3(1,4) M3(1,4)+M3(1,3)],[M3(2,4) M3(2,4)+M3(2,3)],[M3(3,4) M3(3,4)+M3(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([M3(1,4), M4(1,4)],[M3(2,4),M4(2,4)],[M3(3,4),M4(3,4)])
hold on
SX4 = plot3([M4(1,4) M4(1,4)+M4(1,1)],[M4(2,4) M4(2,4)+M4(2,1)],[M4(3,4) M4(3,4)+M4(3,1)],'red','LineStyle','--','LineWidth',1);
SY4 = plot3([M4(1,4) M4(1,4)+M4(1,2)],[M4(2,4) M4(2,4)+M4(2,2)],[M4(3,4) M4(3,4)+M4(3,2)],'green','LineStyle','--','LineWidth',1);
SZ4 = plot3([M4(1,4) M4(1,4)+M4(1,3)],[M4(2,4) M4(2,4)+M4(2,3)],[M4(3,4) M4(3,4)+M4(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([M4(1,4), M5(1,4)],[M4(2,4),M5(2,4)],[M4(3,4),M5(3,4)])
hold on
SX5 = plot3([M5(1,4) M5(1,4)+M5(1,1)],[M5(2,4) M5(2,4)+M5(2,1)],[M5(3,4) M5(3,4)+M5(3,1)],'red','LineStyle','--','LineWidth',1);
SY5 = plot3([M5(1,4) M5(1,4)+M5(1,2)],[M5(2,4) M5(2,4)+M5(2,2)],[M5(3,4) M5(3,4)+M5(3,2)],'green','LineStyle','--','LineWidth',1);
SZ5 = plot3([M5(1,4) M5(1,4)+M5(1,3)],[M5(2,4) M5(2,4)+M5(2,3)],[M5(3,4) M5(3,4)+M5(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([M5(1,4), Z(1,4)],[M5(2,4),Z(2,4)],[M5(3,4),Z(3,4)])
hold on

ZX(e-1)= Z(1,4);
ZY(e-1)= Z(2,4);
ZZ(e-1)= Z(3,4);
L1 = plot3(ZX,ZY,ZZ,'.','linewidth',2);

SX6 = plot3([Z(1,4) Z(1,4)+Z(1,1)],[Z(2,4) Z(2,4)+Z(2,1)],[Z(3,4) Z(3,4)+Z(3,1)],'red','LineStyle','--','LineWidth',1);
SY6 = plot3([Z(1,4) Z(1,4)+Z(1,2)],[Z(2,4) Z(2,4)+Z(2,2)],[Z(3,4) Z(3,4)+Z(3,2)],'green','LineStyle','--','LineWidth',1);
SZ6 = plot3([Z(1,4) Z(1,4)+Z(1,3)],[Z(2,4) Z(2,4)+Z(2,3)],[Z(3,4) Z(3,4)+Z(3,3)],'blue','LineStyle','--','LineWidth',1);
axis([-40 5 -50 25 -20 40]);
grid on
xlabel('Eje X'); ylabel('Eje Y'); zlabel('Eje Z')
camorbit(90,0,'data',[1 0 0])
camorbit(90,0,'data',[0 0 1])
camorbit(30,0,'data',[-1 0 0])
pause(0.01)
reset(gca);
axis([-40 5 -50 25 -20 40]);
grid on
xlabel('Eje X'); ylabel('Eje Y'); zlabel('Eje Z')
camorbit(90,0,'data',[1 0 0])
camorbit(90,0,'data',[0 0 1])
camorbit(30,0,'data',[-1 0 0])
end

%Articulacion 2

for o=2:1:N
    d2 = S2(o);
    
V1=[    180,   d1,     0, -90];
V2=[     90,   d2,     0,  90];
V3=[ q3+180,    3,     0,  90];
V4=[  q4-90,    0, -12.5,   0];
V5=[     q5,    0, -15.5,   0];
V6=[     q6,    0,  -5.7,   0];

A1=[cosd(V1(1)), -cosd(V1(4))*sind(V1(1)),  sind(V1(4))*sind(V1(1)), V1(3)*cosd(V1(1));
    sind(V1(1)),  cosd(V1(4))*cosd(V1(1)), -sind(V1(4))*cosd(V1(1)), V1(3)*sind(V1(1));
              0,              sind(V1(4)),              cosd(V1(4)),             V1(2);
              0,                        0,                        0,                1];
A2=[cosd(V2(1)), -cosd(V2(4))*sind(V2(1)),  sind(V2(4))*sind(V2(1)), V2(3)*cosd(V2(1));
    sind(V2(1)),  cosd(V2(4))*cosd(V2(1)), -sind(V2(4))*cosd(V2(1)), V2(3)*sind(V2(1));
              0,              sind(V2(4)),              cosd(V2(4)),             V2(2);
              0,                        0,                        0,                1];
A3=[cosd(V3(1)), -cosd(V3(4))*sind(V3(1)),  sind(V3(4))*sind(V3(1)), V3(3)*cosd(V3(1));
    sind(V3(1)),  cosd(V3(4))*cosd(V3(1)), -sind(V3(4))*cosd(V3(1)), V3(3)*sind(V3(1));
              0,              sind(V3(4)),              cosd(V3(4)),             V3(2);
              0,                        0,                        0,                1];
A4=[cosd(V4(1)), -cosd(V4(4))*sind(V4(1)),  sind(V4(4))*sind(V4(1)), V4(3)*cosd(V4(1));
    sind(V4(1)),  cosd(V4(4))*cosd(V4(1)), -sind(V4(4))*cosd(V4(1)), V4(3)*sind(V4(1));
              0,              sind(V4(4)),              cosd(V4(4)),             V4(2);
              0,                        0,                        0,                1];
A5=[cosd(V5(1)), -cosd(V5(4))*sind(V5(1)),  sind(V5(4))*sind(V5(1)), V5(3)*cosd(V5(1));
    sind(V5(1)),  cosd(V5(4))*cosd(V5(1)), -sind(V5(4))*cosd(V5(1)), V5(3)*sind(V5(1));
              0,              sind(V5(4)),              cosd(V5(4)),             V5(2);
              0,                        0,                        0,                1];
A6=[cosd(V6(1)), -cosd(V6(4))*sind(V6(1)),  sind(V6(4))*sind(V6(1)), V6(3)*cosd(V6(1));
    sind(V6(1)),  cosd(V6(4))*cosd(V6(1)), -sind(V6(4))*cosd(V6(1)), V6(3)*sind(V6(1));
              0,              sind(V6(4)),              cosd(V6(4)),             V6(2);
              0,                        0,                        0,                1];

M2=A1*A2;
M3=A1*A2*A3;
M4=A1*A2*A3*A4;
M5=A1*A2*A3*A4*A5;
Z=A1*A2*A3*A4*A5*A6;

figure(1);
pause(0.00001);
frame_h = get(handle(gcf),'JavaFrame');
set(frame_h,'Maximized',1);

Y1=plot3([0,A1(1,4)],[0,A1(2,4)],[0,A1(3,4)]);
hold on
SX0 = plot3([0 1],[0 0],[0 0],'red','LineStyle','--','LineWidth',1);
SY0 = plot3([0,0],[0,1],[0,0],'green','LineStyle','--','LineWidth',1);
SZ0 = plot3([0,0],[0,0],[0,1],'blue','LineStyle','--','LineWidth',1);
plot3([0,A1(1,4)],[0,A1(2,4)],[0,A1(3,4)])
hold on
SX1 = plot3([A1(1,4) A1(1,4)+A1(1,1)],[A1(2,4) A1(2,4)+A1(2,1)],[A1(3,4) A1(3,4)+A1(3,1)],'red','LineStyle','--','LineWidth',1);
SY1 = plot3([A1(1,4) A1(1,4)+A1(1,2)],[A1(2,4) A1(2,4)+A1(2,2)],[A1(3,4) A1(3,4)+A1(3,2)],'green','LineStyle','--','LineWidth',1);
SZ1 = plot3([A1(1,4) A1(1,4)+A1(1,3)],[A1(2,4) A1(2,4)+A1(2,3)],[A1(3,4) A1(3,4)+A1(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([A1(1,4), M2(1,4)],[A1(2,4),M2(2,4)],[A1(3,4),M2(3,4)])
hold on
SX2 = plot3([M2(1,4) M2(1,4)+M2(1,1)],[M2(2,4) M2(2,4)+M2(2,1)],[M2(3,4) M2(3,4)+M2(3,1)],'red','LineStyle','--','LineWidth',1);
SY2 = plot3([M2(1,4) M2(1,4)+M2(1,2)],[M2(2,4) M2(2,4)+M2(2,2)],[M2(3,4) M2(3,4)+M2(3,2)],'green','LineStyle','--','LineWidth',1);
SZ2 = plot3([M2(1,4) M2(1,4)+M2(1,3)],[M2(2,4) M2(2,4)+M2(2,3)],[M2(3,4) M2(3,4)+M2(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([M2(1,4), M3(1,4)],[M2(2,4),M3(2,4)],[M2(3,4),M3(3,4)])
hold on
SX3 = plot3([M3(1,4) M3(1,4)+M3(1,1)],[M3(2,4) M3(2,4)+M3(2,1)],[M3(3,4) M3(3,4)+M3(3,1)],'red','LineStyle','--','LineWidth',1);
SY3 = plot3([M3(1,4) M3(1,4)+M3(1,2)],[M3(2,4) M3(2,4)+M3(2,2)],[M3(3,4) M3(3,4)+M3(3,2)],'green','LineStyle','--','LineWidth',1);
SZ3 = plot3([M3(1,4) M3(1,4)+M3(1,3)],[M3(2,4) M3(2,4)+M3(2,3)],[M3(3,4) M3(3,4)+M3(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([M3(1,4), M4(1,4)],[M3(2,4),M4(2,4)],[M3(3,4),M4(3,4)])
hold on
SX4 = plot3([M4(1,4) M4(1,4)+M4(1,1)],[M4(2,4) M4(2,4)+M4(2,1)],[M4(3,4) M4(3,4)+M4(3,1)],'red','LineStyle','--','LineWidth',1);
SY4 = plot3([M4(1,4) M4(1,4)+M4(1,2)],[M4(2,4) M4(2,4)+M4(2,2)],[M4(3,4) M4(3,4)+M4(3,2)],'green','LineStyle','--','LineWidth',1);
SZ4 = plot3([M4(1,4) M4(1,4)+M4(1,3)],[M4(2,4) M4(2,4)+M4(2,3)],[M4(3,4) M4(3,4)+M4(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([M4(1,4), M5(1,4)],[M4(2,4),M5(2,4)],[M4(3,4),M5(3,4)])
hold on
SX5 = plot3([M5(1,4) M5(1,4)+M5(1,1)],[M5(2,4) M5(2,4)+M5(2,1)],[M5(3,4) M5(3,4)+M5(3,1)],'red','LineStyle','--','LineWidth',1);
SY5 = plot3([M5(1,4) M5(1,4)+M5(1,2)],[M5(2,4) M5(2,4)+M5(2,2)],[M5(3,4) M5(3,4)+M5(3,2)],'green','LineStyle','--','LineWidth',1);
SZ5 = plot3([M5(1,4) M5(1,4)+M5(1,3)],[M5(2,4) M5(2,4)+M5(2,3)],[M5(3,4) M5(3,4)+M5(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([M5(1,4), Z(1,4)],[M5(2,4),Z(2,4)],[M5(3,4),Z(3,4)])
hold on

ZX(e+(o-1))= Z(1,4);
ZY(e+(o-1))= Z(2,4);
ZZ(e+(o-1))= Z(3,4);
e = e+(o-1);
L1 = plot3(ZX,ZY,ZZ,'.','linewidth',2);

SX6 = plot3([Z(1,4) Z(1,4)+Z(1,1)],[Z(2,4) Z(2,4)+Z(2,1)],[Z(3,4) Z(3,4)+Z(3,1)],'red','LineStyle','--','LineWidth',1);
SY6 = plot3([Z(1,4) Z(1,4)+Z(1,2)],[Z(2,4) Z(2,4)+Z(2,2)],[Z(3,4) Z(3,4)+Z(3,2)],'green','LineStyle','--','LineWidth',1);
SZ6 = plot3([Z(1,4) Z(1,4)+Z(1,3)],[Z(2,4) Z(2,4)+Z(2,3)],[Z(3,4) Z(3,4)+Z(3,3)],'blue','LineStyle','--','LineWidth',1);
axis([-40 5 -50 25 -20 40]);
grid on
xlabel('Eje X'); ylabel('Eje Y'); zlabel('Eje Z')
camorbit(90,0,'data',[1 0 0])
camorbit(90,0,'data',[0 0 1])
camorbit(30,0,'data',[-1 0 0])
pause(0.01)
reset(gca);
axis([-40 5 -50 25 -20 40]);
grid on
xlabel('Eje X'); ylabel('Eje Y'); zlabel('Eje Z')
camorbit(90,0,'data',[1 0 0])
camorbit(90,0,'data',[0 0 1])
camorbit(30,0,'data',[-1 0 0])
end

%Articulacion 3

for m=2:1:N
    q3 = S3(m);
    
V1=[    180,   d1,     0, -90];
V2=[     90,   d2,     0,  90];
V3=[ q3+180,    3,     0,  90];
V4=[  q4-90,    0, -12.5,   0];
V5=[     q5,    0, -15.5,   0];
V6=[     q6,    0,  -5.7,   0];

A1=[cosd(V1(1)), -cosd(V1(4))*sind(V1(1)),  sind(V1(4))*sind(V1(1)), V1(3)*cosd(V1(1));
    sind(V1(1)),  cosd(V1(4))*cosd(V1(1)), -sind(V1(4))*cosd(V1(1)), V1(3)*sind(V1(1));
              0,              sind(V1(4)),              cosd(V1(4)),             V1(2);
              0,                        0,                        0,                1];
A2=[cosd(V2(1)), -cosd(V2(4))*sind(V2(1)),  sind(V2(4))*sind(V2(1)), V2(3)*cosd(V2(1));
    sind(V2(1)),  cosd(V2(4))*cosd(V2(1)), -sind(V2(4))*cosd(V2(1)), V2(3)*sind(V2(1));
              0,              sind(V2(4)),              cosd(V2(4)),             V2(2);
              0,                        0,                        0,                1];
A3=[cosd(V3(1)), -cosd(V3(4))*sind(V3(1)),  sind(V3(4))*sind(V3(1)), V3(3)*cosd(V3(1));
    sind(V3(1)),  cosd(V3(4))*cosd(V3(1)), -sind(V3(4))*cosd(V3(1)), V3(3)*sind(V3(1));
              0,              sind(V3(4)),              cosd(V3(4)),             V3(2);
              0,                        0,                        0,                1];
A4=[cosd(V4(1)), -cosd(V4(4))*sind(V4(1)),  sind(V4(4))*sind(V4(1)), V4(3)*cosd(V4(1));
    sind(V4(1)),  cosd(V4(4))*cosd(V4(1)), -sind(V4(4))*cosd(V4(1)), V4(3)*sind(V4(1));
              0,              sind(V4(4)),              cosd(V4(4)),             V4(2);
              0,                        0,                        0,                1];
A5=[cosd(V5(1)), -cosd(V5(4))*sind(V5(1)),  sind(V5(4))*sind(V5(1)), V5(3)*cosd(V5(1));
    sind(V5(1)),  cosd(V5(4))*cosd(V5(1)), -sind(V5(4))*cosd(V5(1)), V5(3)*sind(V5(1));
              0,              sind(V5(4)),              cosd(V5(4)),             V5(2);
              0,                        0,                        0,                1];
A6=[cosd(V6(1)), -cosd(V6(4))*sind(V6(1)),  sind(V6(4))*sind(V6(1)), V6(3)*cosd(V6(1));
    sind(V6(1)),  cosd(V6(4))*cosd(V6(1)), -sind(V6(4))*cosd(V6(1)), V6(3)*sind(V6(1));
              0,              sind(V6(4)),              cosd(V6(4)),             V6(2);
              0,                        0,                        0,                1];

M2=A1*A2;
M3=A1*A2*A3;
M4=A1*A2*A3*A4;
M5=A1*A2*A3*A4*A5;
Z=A1*A2*A3*A4*A5*A6;

figure(1);
pause(0.00001);
frame_h = get(handle(gcf),'JavaFrame');
set(frame_h,'Maximized',1);

Y1=plot3([0,A1(1,4)],[0,A1(2,4)],[0,A1(3,4)]);
hold on
SX0 = plot3([0 1],[0 0],[0 0],'red','LineStyle','--','LineWidth',1);
SY0 = plot3([0,0],[0,1],[0,0],'green','LineStyle','--','LineWidth',1);
SZ0 = plot3([0,0],[0,0],[0,1],'blue','LineStyle','--','LineWidth',1);
plot3([0,A1(1,4)],[0,A1(2,4)],[0,A1(3,4)])
hold on
SX1 = plot3([A1(1,4) A1(1,4)+A1(1,1)],[A1(2,4) A1(2,4)+A1(2,1)],[A1(3,4) A1(3,4)+A1(3,1)],'red','LineStyle','--','LineWidth',1);
SY1 = plot3([A1(1,4) A1(1,4)+A1(1,2)],[A1(2,4) A1(2,4)+A1(2,2)],[A1(3,4) A1(3,4)+A1(3,2)],'green','LineStyle','--','LineWidth',1);
SZ1 = plot3([A1(1,4) A1(1,4)+A1(1,3)],[A1(2,4) A1(2,4)+A1(2,3)],[A1(3,4) A1(3,4)+A1(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([A1(1,4), M2(1,4)],[A1(2,4),M2(2,4)],[A1(3,4),M2(3,4)])
hold on
SX2 = plot3([M2(1,4) M2(1,4)+M2(1,1)],[M2(2,4) M2(2,4)+M2(2,1)],[M2(3,4) M2(3,4)+M2(3,1)],'red','LineStyle','--','LineWidth',1);
SY2 = plot3([M2(1,4) M2(1,4)+M2(1,2)],[M2(2,4) M2(2,4)+M2(2,2)],[M2(3,4) M2(3,4)+M2(3,2)],'green','LineStyle','--','LineWidth',1);
SZ2 = plot3([M2(1,4) M2(1,4)+M2(1,3)],[M2(2,4) M2(2,4)+M2(2,3)],[M2(3,4) M2(3,4)+M2(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([M2(1,4), M3(1,4)],[M2(2,4),M3(2,4)],[M2(3,4),M3(3,4)])
hold on
SX3 = plot3([M3(1,4) M3(1,4)+M3(1,1)],[M3(2,4) M3(2,4)+M3(2,1)],[M3(3,4) M3(3,4)+M3(3,1)],'red','LineStyle','--','LineWidth',1);
SY3 = plot3([M3(1,4) M3(1,4)+M3(1,2)],[M3(2,4) M3(2,4)+M3(2,2)],[M3(3,4) M3(3,4)+M3(3,2)],'green','LineStyle','--','LineWidth',1);
SZ3 = plot3([M3(1,4) M3(1,4)+M3(1,3)],[M3(2,4) M3(2,4)+M3(2,3)],[M3(3,4) M3(3,4)+M3(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([M3(1,4), M4(1,4)],[M3(2,4),M4(2,4)],[M3(3,4),M4(3,4)])
hold on
SX4 = plot3([M4(1,4) M4(1,4)+M4(1,1)],[M4(2,4) M4(2,4)+M4(2,1)],[M4(3,4) M4(3,4)+M4(3,1)],'red','LineStyle','--','LineWidth',1);
SY4 = plot3([M4(1,4) M4(1,4)+M4(1,2)],[M4(2,4) M4(2,4)+M4(2,2)],[M4(3,4) M4(3,4)+M4(3,2)],'green','LineStyle','--','LineWidth',1);
SZ4 = plot3([M4(1,4) M4(1,4)+M4(1,3)],[M4(2,4) M4(2,4)+M4(2,3)],[M4(3,4) M4(3,4)+M4(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([M4(1,4), M5(1,4)],[M4(2,4),M5(2,4)],[M4(3,4),M5(3,4)])
hold on
SX5 = plot3([M5(1,4) M5(1,4)+M5(1,1)],[M5(2,4) M5(2,4)+M5(2,1)],[M5(3,4) M5(3,4)+M5(3,1)],'red','LineStyle','--','LineWidth',1);
SY5 = plot3([M5(1,4) M5(1,4)+M5(1,2)],[M5(2,4) M5(2,4)+M5(2,2)],[M5(3,4) M5(3,4)+M5(3,2)],'green','LineStyle','--','LineWidth',1);
SZ5 = plot3([M5(1,4) M5(1,4)+M5(1,3)],[M5(2,4) M5(2,4)+M5(2,3)],[M5(3,4) M5(3,4)+M5(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([M5(1,4), Z(1,4)],[M5(2,4),Z(2,4)],[M5(3,4),Z(3,4)])
hold on

ZX(e+(m-1))= Z(1,4);
ZY(e+(m-1))= Z(2,4);
ZZ(e+(m-1))= Z(3,4);
e = e+(m+1);
L1 = plot3(ZX,ZY,ZZ,'.','linewidth',2);

SX6 = plot3([Z(1,4) Z(1,4)+Z(1,1)],[Z(2,4) Z(2,4)+Z(2,1)],[Z(3,4) Z(3,4)+Z(3,1)],'red','LineStyle','--','LineWidth',1);
SY6 = plot3([Z(1,4) Z(1,4)+Z(1,2)],[Z(2,4) Z(2,4)+Z(2,2)],[Z(3,4) Z(3,4)+Z(3,2)],'green','LineStyle','--','LineWidth',1);
SZ6 = plot3([Z(1,4) Z(1,4)+Z(1,3)],[Z(2,4) Z(2,4)+Z(2,3)],[Z(3,4) Z(3,4)+Z(3,3)],'blue','LineStyle','--','LineWidth',1);
axis([-40 5 -50 25 -20 40]);
grid on
xlabel('Eje X'); ylabel('Eje Y'); zlabel('Eje Z')
camorbit(90,0,'data',[1 0 0])
camorbit(90,0,'data',[0 0 1])
camorbit(30,0,'data',[-1 0 0])
pause(0.01)
reset(gca);
axis([-40 5 -50 25 -20 40]);
grid on
xlabel('Eje X'); ylabel('Eje Y'); zlabel('Eje Z')
camorbit(90,0,'data',[1 0 0])
camorbit(90,0,'data',[0 0 1])
camorbit(30,0,'data',[-1 0 0])
end

%Articulacion 4

for n=2:1:N
    q4 = S4(n);
    
V1=[    180,   d1,     0, -90];
V2=[     90,   d2,     0,  90];
V3=[ q3+180,    3,     0,  90];
V4=[  q4-90,    0, -12.5,   0];
V5=[     q5,    0, -15.5,   0];
V6=[     q6,    0,  -5.7,   0];

A1=[cosd(V1(1)), -cosd(V1(4))*sind(V1(1)),  sind(V1(4))*sind(V1(1)), V1(3)*cosd(V1(1));
    sind(V1(1)),  cosd(V1(4))*cosd(V1(1)), -sind(V1(4))*cosd(V1(1)), V1(3)*sind(V1(1));
              0,              sind(V1(4)),              cosd(V1(4)),             V1(2);
              0,                        0,                        0,                1];
A2=[cosd(V2(1)), -cosd(V2(4))*sind(V2(1)),  sind(V2(4))*sind(V2(1)), V2(3)*cosd(V2(1));
    sind(V2(1)),  cosd(V2(4))*cosd(V2(1)), -sind(V2(4))*cosd(V2(1)), V2(3)*sind(V2(1));
              0,              sind(V2(4)),              cosd(V2(4)),             V2(2);
              0,                        0,                        0,                1];
A3=[cosd(V3(1)), -cosd(V3(4))*sind(V3(1)),  sind(V3(4))*sind(V3(1)), V3(3)*cosd(V3(1));
    sind(V3(1)),  cosd(V3(4))*cosd(V3(1)), -sind(V3(4))*cosd(V3(1)), V3(3)*sind(V3(1));
              0,              sind(V3(4)),              cosd(V3(4)),             V3(2);
              0,                        0,                        0,                1];
A4=[cosd(V4(1)), -cosd(V4(4))*sind(V4(1)),  sind(V4(4))*sind(V4(1)), V4(3)*cosd(V4(1));
    sind(V4(1)),  cosd(V4(4))*cosd(V4(1)), -sind(V4(4))*cosd(V4(1)), V4(3)*sind(V4(1));
              0,              sind(V4(4)),              cosd(V4(4)),             V4(2);
              0,                        0,                        0,                1];
A5=[cosd(V5(1)), -cosd(V5(4))*sind(V5(1)),  sind(V5(4))*sind(V5(1)), V5(3)*cosd(V5(1));
    sind(V5(1)),  cosd(V5(4))*cosd(V5(1)), -sind(V5(4))*cosd(V5(1)), V5(3)*sind(V5(1));
              0,              sind(V5(4)),              cosd(V5(4)),             V5(2);
              0,                        0,                        0,                1];
A6=[cosd(V6(1)), -cosd(V6(4))*sind(V6(1)),  sind(V6(4))*sind(V6(1)), V6(3)*cosd(V6(1));
    sind(V6(1)),  cosd(V6(4))*cosd(V6(1)), -sind(V6(4))*cosd(V6(1)), V6(3)*sind(V6(1));
              0,              sind(V6(4)),              cosd(V6(4)),             V6(2);
              0,                        0,                        0,                1];

M2=A1*A2;
M3=A1*A2*A3;
M4=A1*A2*A3*A4;
M5=A1*A2*A3*A4*A5;
Z=A1*A2*A3*A4*A5*A6;

figure(1);
pause(0.00001);
frame_h = get(handle(gcf),'JavaFrame');
set(frame_h,'Maximized',1);

Y1=plot3([0,A1(1,4)],[0,A1(2,4)],[0,A1(3,4)]);
hold on
SX0 = plot3([0 1],[0 0],[0 0],'red','LineStyle','--','LineWidth',1);
SY0 = plot3([0,0],[0,1],[0,0],'green','LineStyle','--','LineWidth',1);
SZ0 = plot3([0,0],[0,0],[0,1],'blue','LineStyle','--','LineWidth',1);
plot3([0,A1(1,4)],[0,A1(2,4)],[0,A1(3,4)])
hold on
SX1 = plot3([A1(1,4) A1(1,4)+A1(1,1)],[A1(2,4) A1(2,4)+A1(2,1)],[A1(3,4) A1(3,4)+A1(3,1)],'red','LineStyle','--','LineWidth',1);
SY1 = plot3([A1(1,4) A1(1,4)+A1(1,2)],[A1(2,4) A1(2,4)+A1(2,2)],[A1(3,4) A1(3,4)+A1(3,2)],'green','LineStyle','--','LineWidth',1);
SZ1 = plot3([A1(1,4) A1(1,4)+A1(1,3)],[A1(2,4) A1(2,4)+A1(2,3)],[A1(3,4) A1(3,4)+A1(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([A1(1,4), M2(1,4)],[A1(2,4),M2(2,4)],[A1(3,4),M2(3,4)])
hold on
SX2 = plot3([M2(1,4) M2(1,4)+M2(1,1)],[M2(2,4) M2(2,4)+M2(2,1)],[M2(3,4) M2(3,4)+M2(3,1)],'red','LineStyle','--','LineWidth',1);
SY2 = plot3([M2(1,4) M2(1,4)+M2(1,2)],[M2(2,4) M2(2,4)+M2(2,2)],[M2(3,4) M2(3,4)+M2(3,2)],'green','LineStyle','--','LineWidth',1);
SZ2 = plot3([M2(1,4) M2(1,4)+M2(1,3)],[M2(2,4) M2(2,4)+M2(2,3)],[M2(3,4) M2(3,4)+M2(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([M2(1,4), M3(1,4)],[M2(2,4),M3(2,4)],[M2(3,4),M3(3,4)])
hold on
SX3 = plot3([M3(1,4) M3(1,4)+M3(1,1)],[M3(2,4) M3(2,4)+M3(2,1)],[M3(3,4) M3(3,4)+M3(3,1)],'red','LineStyle','--','LineWidth',1);
SY3 = plot3([M3(1,4) M3(1,4)+M3(1,2)],[M3(2,4) M3(2,4)+M3(2,2)],[M3(3,4) M3(3,4)+M3(3,2)],'green','LineStyle','--','LineWidth',1);
SZ3 = plot3([M3(1,4) M3(1,4)+M3(1,3)],[M3(2,4) M3(2,4)+M3(2,3)],[M3(3,4) M3(3,4)+M3(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([M3(1,4), M4(1,4)],[M3(2,4),M4(2,4)],[M3(3,4),M4(3,4)])
hold on
SX4 = plot3([M4(1,4) M4(1,4)+M4(1,1)],[M4(2,4) M4(2,4)+M4(2,1)],[M4(3,4) M4(3,4)+M4(3,1)],'red','LineStyle','--','LineWidth',1);
SY4 = plot3([M4(1,4) M4(1,4)+M4(1,2)],[M4(2,4) M4(2,4)+M4(2,2)],[M4(3,4) M4(3,4)+M4(3,2)],'green','LineStyle','--','LineWidth',1);
SZ4 = plot3([M4(1,4) M4(1,4)+M4(1,3)],[M4(2,4) M4(2,4)+M4(2,3)],[M4(3,4) M4(3,4)+M4(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([M4(1,4), M5(1,4)],[M4(2,4),M5(2,4)],[M4(3,4),M5(3,4)])
hold on
SX5 = plot3([M5(1,4) M5(1,4)+M5(1,1)],[M5(2,4) M5(2,4)+M5(2,1)],[M5(3,4) M5(3,4)+M5(3,1)],'red','LineStyle','--','LineWidth',1);
SY5 = plot3([M5(1,4) M5(1,4)+M5(1,2)],[M5(2,4) M5(2,4)+M5(2,2)],[M5(3,4) M5(3,4)+M5(3,2)],'green','LineStyle','--','LineWidth',1);
SZ5 = plot3([M5(1,4) M5(1,4)+M5(1,3)],[M5(2,4) M5(2,4)+M5(2,3)],[M5(3,4) M5(3,4)+M5(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([M5(1,4), Z(1,4)],[M5(2,4),Z(2,4)],[M5(3,4),Z(3,4)])
hold on

ZX(e+(n-1))= Z(1,4);
ZY(e+(n-1))= Z(2,4);
ZZ(e+(n-1))= Z(3,4);
e = e+(n-1);
L1 = plot3(ZX,ZY,ZZ,'.','linewidth',2);

SX6 = plot3([Z(1,4) Z(1,4)+Z(1,1)],[Z(2,4) Z(2,4)+Z(2,1)],[Z(3,4) Z(3,4)+Z(3,1)],'red','LineStyle','--','LineWidth',1);
SY6 = plot3([Z(1,4) Z(1,4)+Z(1,2)],[Z(2,4) Z(2,4)+Z(2,2)],[Z(3,4) Z(3,4)+Z(3,2)],'green','LineStyle','--','LineWidth',1);
SZ6 = plot3([Z(1,4) Z(1,4)+Z(1,3)],[Z(2,4) Z(2,4)+Z(2,3)],[Z(3,4) Z(3,4)+Z(3,3)],'blue','LineStyle','--','LineWidth',1);
axis([-40 5 -50 25 -20 40]);
grid on
xlabel('Eje X'); ylabel('Eje Y'); zlabel('Eje Z')
camorbit(90,0,'data',[1 0 0])
camorbit(90,0,'data',[0 0 1])
camorbit(30,0,'data',[-1 0 0])
pause(0.01)
reset(gca);
axis([-40 5 -50 25 -20 40]);
grid on
xlabel('Eje X'); ylabel('Eje Y'); zlabel('Eje Z')
camorbit(90,0,'data',[1 0 0])
camorbit(90,0,'data',[0 0 1])
camorbit(30,0,'data',[-1 0 0])
end

%Articulacion 5

for l=2:1:N
    q5 = S5(l);
    
V1=[    180,   d1,     0, -90];
V2=[     90,   d2,     0,  90];
V3=[ q3+180,    3,     0,  90];
V4=[  q4-90,    0, -12.5,   0];
V5=[     q5,    0, -15.5,   0];
V6=[     q6,    0,  -5.7,   0];

A1=[cosd(V1(1)), -cosd(V1(4))*sind(V1(1)),  sind(V1(4))*sind(V1(1)), V1(3)*cosd(V1(1));
    sind(V1(1)),  cosd(V1(4))*cosd(V1(1)), -sind(V1(4))*cosd(V1(1)), V1(3)*sind(V1(1));
              0,              sind(V1(4)),              cosd(V1(4)),             V1(2);
              0,                        0,                        0,                1];
A2=[cosd(V2(1)), -cosd(V2(4))*sind(V2(1)),  sind(V2(4))*sind(V2(1)), V2(3)*cosd(V2(1));
    sind(V2(1)),  cosd(V2(4))*cosd(V2(1)), -sind(V2(4))*cosd(V2(1)), V2(3)*sind(V2(1));
              0,              sind(V2(4)),              cosd(V2(4)),             V2(2);
              0,                        0,                        0,                1];
A3=[cosd(V3(1)), -cosd(V3(4))*sind(V3(1)),  sind(V3(4))*sind(V3(1)), V3(3)*cosd(V3(1));
    sind(V3(1)),  cosd(V3(4))*cosd(V3(1)), -sind(V3(4))*cosd(V3(1)), V3(3)*sind(V3(1));
              0,              sind(V3(4)),              cosd(V3(4)),             V3(2);
              0,                        0,                        0,                1];
A4=[cosd(V4(1)), -cosd(V4(4))*sind(V4(1)),  sind(V4(4))*sind(V4(1)), V4(3)*cosd(V4(1));
    sind(V4(1)),  cosd(V4(4))*cosd(V4(1)), -sind(V4(4))*cosd(V4(1)), V4(3)*sind(V4(1));
              0,              sind(V4(4)),              cosd(V4(4)),             V4(2);
              0,                        0,                        0,                1];
A5=[cosd(V5(1)), -cosd(V5(4))*sind(V5(1)),  sind(V5(4))*sind(V5(1)), V5(3)*cosd(V5(1));
    sind(V5(1)),  cosd(V5(4))*cosd(V5(1)), -sind(V5(4))*cosd(V5(1)), V5(3)*sind(V5(1));
              0,              sind(V5(4)),              cosd(V5(4)),             V5(2);
              0,                        0,                        0,                1];
A6=[cosd(V6(1)), -cosd(V6(4))*sind(V6(1)),  sind(V6(4))*sind(V6(1)), V6(3)*cosd(V6(1));
    sind(V6(1)),  cosd(V6(4))*cosd(V6(1)), -sind(V6(4))*cosd(V6(1)), V6(3)*sind(V6(1));
              0,              sind(V6(4)),              cosd(V6(4)),             V6(2);
              0,                        0,                        0,                1];

M2=A1*A2;
M3=A1*A2*A3;
M4=A1*A2*A3*A4;
M5=A1*A2*A3*A4*A5;
Z=A1*A2*A3*A4*A5*A6;

figure(1);
pause(0.00001);
frame_h = get(handle(gcf),'JavaFrame');
set(frame_h,'Maximized',1);

Y1=plot3([0,A1(1,4)],[0,A1(2,4)],[0,A1(3,4)]);
hold on
SX0 = plot3([0 1],[0 0],[0 0],'red','LineStyle','--','LineWidth',1);
SY0 = plot3([0,0],[0,1],[0,0],'green','LineStyle','--','LineWidth',1);
SZ0 = plot3([0,0],[0,0],[0,1],'blue','LineStyle','--','LineWidth',1);
plot3([0,A1(1,4)],[0,A1(2,4)],[0,A1(3,4)])
hold on
SX1 = plot3([A1(1,4) A1(1,4)+A1(1,1)],[A1(2,4) A1(2,4)+A1(2,1)],[A1(3,4) A1(3,4)+A1(3,1)],'red','LineStyle','--','LineWidth',1);
SY1 = plot3([A1(1,4) A1(1,4)+A1(1,2)],[A1(2,4) A1(2,4)+A1(2,2)],[A1(3,4) A1(3,4)+A1(3,2)],'green','LineStyle','--','LineWidth',1);
SZ1 = plot3([A1(1,4) A1(1,4)+A1(1,3)],[A1(2,4) A1(2,4)+A1(2,3)],[A1(3,4) A1(3,4)+A1(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([A1(1,4), M2(1,4)],[A1(2,4),M2(2,4)],[A1(3,4),M2(3,4)])
hold on
SX2 = plot3([M2(1,4) M2(1,4)+M2(1,1)],[M2(2,4) M2(2,4)+M2(2,1)],[M2(3,4) M2(3,4)+M2(3,1)],'red','LineStyle','--','LineWidth',1);
SY2 = plot3([M2(1,4) M2(1,4)+M2(1,2)],[M2(2,4) M2(2,4)+M2(2,2)],[M2(3,4) M2(3,4)+M2(3,2)],'green','LineStyle','--','LineWidth',1);
SZ2 = plot3([M2(1,4) M2(1,4)+M2(1,3)],[M2(2,4) M2(2,4)+M2(2,3)],[M2(3,4) M2(3,4)+M2(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([M2(1,4), M3(1,4)],[M2(2,4),M3(2,4)],[M2(3,4),M3(3,4)])
hold on
SX3 = plot3([M3(1,4) M3(1,4)+M3(1,1)],[M3(2,4) M3(2,4)+M3(2,1)],[M3(3,4) M3(3,4)+M3(3,1)],'red','LineStyle','--','LineWidth',1);
SY3 = plot3([M3(1,4) M3(1,4)+M3(1,2)],[M3(2,4) M3(2,4)+M3(2,2)],[M3(3,4) M3(3,4)+M3(3,2)],'green','LineStyle','--','LineWidth',1);
SZ3 = plot3([M3(1,4) M3(1,4)+M3(1,3)],[M3(2,4) M3(2,4)+M3(2,3)],[M3(3,4) M3(3,4)+M3(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([M3(1,4), M4(1,4)],[M3(2,4),M4(2,4)],[M3(3,4),M4(3,4)])
hold on
SX4 = plot3([M4(1,4) M4(1,4)+M4(1,1)],[M4(2,4) M4(2,4)+M4(2,1)],[M4(3,4) M4(3,4)+M4(3,1)],'red','LineStyle','--','LineWidth',1);
SY4 = plot3([M4(1,4) M4(1,4)+M4(1,2)],[M4(2,4) M4(2,4)+M4(2,2)],[M4(3,4) M4(3,4)+M4(3,2)],'green','LineStyle','--','LineWidth',1);
SZ4 = plot3([M4(1,4) M4(1,4)+M4(1,3)],[M4(2,4) M4(2,4)+M4(2,3)],[M4(3,4) M4(3,4)+M4(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([M4(1,4), M5(1,4)],[M4(2,4),M5(2,4)],[M4(3,4),M5(3,4)])
hold on
SX5 = plot3([M5(1,4) M5(1,4)+M5(1,1)],[M5(2,4) M5(2,4)+M5(2,1)],[M5(3,4) M5(3,4)+M5(3,1)],'red','LineStyle','--','LineWidth',1);
SY5 = plot3([M5(1,4) M5(1,4)+M5(1,2)],[M5(2,4) M5(2,4)+M5(2,2)],[M5(3,4) M5(3,4)+M5(3,2)],'green','LineStyle','--','LineWidth',1);
SZ5 = plot3([M5(1,4) M5(1,4)+M5(1,3)],[M5(2,4) M5(2,4)+M5(2,3)],[M5(3,4) M5(3,4)+M5(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([M5(1,4), Z(1,4)],[M5(2,4),Z(2,4)],[M5(3,4),Z(3,4)])
hold on

ZX(e+(l-1))= Z(1,4);
ZY(e+(l-1))= Z(2,4);
ZZ(e+(l-1))= Z(3,4);
e = e+(l-1);
L1 = plot3(ZX,ZY,ZZ,'.','linewidth',2);

SX6 = plot3([Z(1,4) Z(1,4)+Z(1,1)],[Z(2,4) Z(2,4)+Z(2,1)],[Z(3,4) Z(3,4)+Z(3,1)],'red','LineStyle','--','LineWidth',1);
SY6 = plot3([Z(1,4) Z(1,4)+Z(1,2)],[Z(2,4) Z(2,4)+Z(2,2)],[Z(3,4) Z(3,4)+Z(3,2)],'green','LineStyle','--','LineWidth',1);
SZ6 = plot3([Z(1,4) Z(1,4)+Z(1,3)],[Z(2,4) Z(2,4)+Z(2,3)],[Z(3,4) Z(3,4)+Z(3,3)],'blue','LineStyle','--','LineWidth',1);
axis([-40 5 -50 25 -20 40]);
grid on
xlabel('Eje X'); ylabel('Eje Y'); zlabel('Eje Z')
camorbit(90,0,'data',[1 0 0])
camorbit(90,0,'data',[0 0 1])
camorbit(30,0,'data',[-1 0 0])
pause(0.01)
reset(gca);
axis([-40 5 -50 25 -20 40]);
grid on
xlabel('Eje X'); ylabel('Eje Y'); zlabel('Eje Z')
camorbit(90,0,'data',[1 0 0])
camorbit(90,0,'data',[0 0 1])
camorbit(30,0,'data',[-1 0 0])
end

%Articulacion 6

for p=2:1:N
    q6 = S6(p);
    
V1=[    180,   d1,     0, -90];
V2=[     90,   d2,     0,  90];
V3=[ q3+180,    3,     0,  90];
V4=[  q4-90,    0, -12.5,   0];
V5=[     q5,    0, -15.5,   0];
V6=[     q6,    0,  -5.7,   0];

A1=[cosd(V1(1)), -cosd(V1(4))*sind(V1(1)),  sind(V1(4))*sind(V1(1)), V1(3)*cosd(V1(1));
    sind(V1(1)),  cosd(V1(4))*cosd(V1(1)), -sind(V1(4))*cosd(V1(1)), V1(3)*sind(V1(1));
              0,              sind(V1(4)),              cosd(V1(4)),             V1(2);
              0,                        0,                        0,                1];
A2=[cosd(V2(1)), -cosd(V2(4))*sind(V2(1)),  sind(V2(4))*sind(V2(1)), V2(3)*cosd(V2(1));
    sind(V2(1)),  cosd(V2(4))*cosd(V2(1)), -sind(V2(4))*cosd(V2(1)), V2(3)*sind(V2(1));
              0,              sind(V2(4)),              cosd(V2(4)),             V2(2);
              0,                        0,                        0,                1];
A3=[cosd(V3(1)), -cosd(V3(4))*sind(V3(1)),  sind(V3(4))*sind(V3(1)), V3(3)*cosd(V3(1));
    sind(V3(1)),  cosd(V3(4))*cosd(V3(1)), -sind(V3(4))*cosd(V3(1)), V3(3)*sind(V3(1));
              0,              sind(V3(4)),              cosd(V3(4)),             V3(2);
              0,                        0,                        0,                1];
A4=[cosd(V4(1)), -cosd(V4(4))*sind(V4(1)),  sind(V4(4))*sind(V4(1)), V4(3)*cosd(V4(1));
    sind(V4(1)),  cosd(V4(4))*cosd(V4(1)), -sind(V4(4))*cosd(V4(1)), V4(3)*sind(V4(1));
              0,              sind(V4(4)),              cosd(V4(4)),             V4(2);
              0,                        0,                        0,                1];
A5=[cosd(V5(1)), -cosd(V5(4))*sind(V5(1)),  sind(V5(4))*sind(V5(1)), V5(3)*cosd(V5(1));
    sind(V5(1)),  cosd(V5(4))*cosd(V5(1)), -sind(V5(4))*cosd(V5(1)), V5(3)*sind(V5(1));
              0,              sind(V5(4)),              cosd(V5(4)),             V5(2);
              0,                        0,                        0,                1];
A6=[cosd(V6(1)), -cosd(V6(4))*sind(V6(1)),  sind(V6(4))*sind(V6(1)), V6(3)*cosd(V6(1));
    sind(V6(1)),  cosd(V6(4))*cosd(V6(1)), -sind(V6(4))*cosd(V6(1)), V6(3)*sind(V6(1));
              0,              sind(V6(4)),              cosd(V6(4)),             V6(2);
              0,                        0,                        0,                1];

M2=A1*A2;
M3=A1*A2*A3;
M4=A1*A2*A3*A4;
M5=A1*A2*A3*A4*A5;
Z=A1*A2*A3*A4*A5*A6;

figure(1);
pause(0.00001);
frame_h = get(handle(gcf),'JavaFrame');
set(frame_h,'Maximized',1);

Y1=plot3([0,A1(1,4)],[0,A1(2,4)],[0,A1(3,4)]);
hold on
SX0 = plot3([0 1],[0 0],[0 0],'red','LineStyle','--','LineWidth',1);
SY0 = plot3([0,0],[0,1],[0,0],'green','LineStyle','--','LineWidth',1);
SZ0 = plot3([0,0],[0,0],[0,1],'blue','LineStyle','--','LineWidth',1);
plot3([0,A1(1,4)],[0,A1(2,4)],[0,A1(3,4)])
hold on
SX1 = plot3([A1(1,4) A1(1,4)+A1(1,1)],[A1(2,4) A1(2,4)+A1(2,1)],[A1(3,4) A1(3,4)+A1(3,1)],'red','LineStyle','--','LineWidth',1);
SY1 = plot3([A1(1,4) A1(1,4)+A1(1,2)],[A1(2,4) A1(2,4)+A1(2,2)],[A1(3,4) A1(3,4)+A1(3,2)],'green','LineStyle','--','LineWidth',1);
SZ1 = plot3([A1(1,4) A1(1,4)+A1(1,3)],[A1(2,4) A1(2,4)+A1(2,3)],[A1(3,4) A1(3,4)+A1(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([A1(1,4), M2(1,4)],[A1(2,4),M2(2,4)],[A1(3,4),M2(3,4)])
hold on
SX2 = plot3([M2(1,4) M2(1,4)+M2(1,1)],[M2(2,4) M2(2,4)+M2(2,1)],[M2(3,4) M2(3,4)+M2(3,1)],'red','LineStyle','--','LineWidth',1);
SY2 = plot3([M2(1,4) M2(1,4)+M2(1,2)],[M2(2,4) M2(2,4)+M2(2,2)],[M2(3,4) M2(3,4)+M2(3,2)],'green','LineStyle','--','LineWidth',1);
SZ2 = plot3([M2(1,4) M2(1,4)+M2(1,3)],[M2(2,4) M2(2,4)+M2(2,3)],[M2(3,4) M2(3,4)+M2(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([M2(1,4), M3(1,4)],[M2(2,4),M3(2,4)],[M2(3,4),M3(3,4)])
hold on
SX3 = plot3([M3(1,4) M3(1,4)+M3(1,1)],[M3(2,4) M3(2,4)+M3(2,1)],[M3(3,4) M3(3,4)+M3(3,1)],'red','LineStyle','--','LineWidth',1);
SY3 = plot3([M3(1,4) M3(1,4)+M3(1,2)],[M3(2,4) M3(2,4)+M3(2,2)],[M3(3,4) M3(3,4)+M3(3,2)],'green','LineStyle','--','LineWidth',1);
SZ3 = plot3([M3(1,4) M3(1,4)+M3(1,3)],[M3(2,4) M3(2,4)+M3(2,3)],[M3(3,4) M3(3,4)+M3(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([M3(1,4), M4(1,4)],[M3(2,4),M4(2,4)],[M3(3,4),M4(3,4)])
hold on
SX4 = plot3([M4(1,4) M4(1,4)+M4(1,1)],[M4(2,4) M4(2,4)+M4(2,1)],[M4(3,4) M4(3,4)+M4(3,1)],'red','LineStyle','--','LineWidth',1);
SY4 = plot3([M4(1,4) M4(1,4)+M4(1,2)],[M4(2,4) M4(2,4)+M4(2,2)],[M4(3,4) M4(3,4)+M4(3,2)],'green','LineStyle','--','LineWidth',1);
SZ4 = plot3([M4(1,4) M4(1,4)+M4(1,3)],[M4(2,4) M4(2,4)+M4(2,3)],[M4(3,4) M4(3,4)+M4(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([M4(1,4), M5(1,4)],[M4(2,4),M5(2,4)],[M4(3,4),M5(3,4)])
hold on
SX5 = plot3([M5(1,4) M5(1,4)+M5(1,1)],[M5(2,4) M5(2,4)+M5(2,1)],[M5(3,4) M5(3,4)+M5(3,1)],'red','LineStyle','--','LineWidth',1);
SY5 = plot3([M5(1,4) M5(1,4)+M5(1,2)],[M5(2,4) M5(2,4)+M5(2,2)],[M5(3,4) M5(3,4)+M5(3,2)],'green','LineStyle','--','LineWidth',1);
SZ5 = plot3([M5(1,4) M5(1,4)+M5(1,3)],[M5(2,4) M5(2,4)+M5(2,3)],[M5(3,4) M5(3,4)+M5(3,3)],'blue','LineStyle','--','LineWidth',1);
plot3([M5(1,4), Z(1,4)],[M5(2,4),Z(2,4)],[M5(3,4),Z(3,4)])
hold on

ZX(e+(p-1))= Z(1,4);
ZY(e+(p-1))= Z(2,4);
ZZ(e+(p-1))= Z(3,4);
L1 = plot3(ZX,ZY,ZZ,'.','linewidth',2);

SX6 = plot3([Z(1,4) Z(1,4)+Z(1,1)],[Z(2,4) Z(2,4)+Z(2,1)],[Z(3,4) Z(3,4)+Z(3,1)],'red','LineStyle','--','LineWidth',1);
SY6 = plot3([Z(1,4) Z(1,4)+Z(1,2)],[Z(2,4) Z(2,4)+Z(2,2)],[Z(3,4) Z(3,4)+Z(3,2)],'green','LineStyle','--','LineWidth',1);
SZ6 = plot3([Z(1,4) Z(1,4)+Z(1,3)],[Z(2,4) Z(2,4)+Z(2,3)],[Z(3,4) Z(3,4)+Z(3,3)],'blue','LineStyle','--','LineWidth',1);
axis([-40 5 -50 25 -20 40]);
grid on
xlabel('Eje X'); ylabel('Eje Y'); zlabel('Eje Z')
camorbit(90,0,'data',[1 0 0])
camorbit(90,0,'data',[0 0 1])
camorbit(30,0,'data',[-1 0 0])
pause(0.01)
reset(gca);
axis([-40 5 -50 25 -20 40]);
grid on
xlabel('Eje X'); ylabel('Eje Y'); zlabel('Eje Z')
camorbit(90,0,'data',[1 0 0])
camorbit(90,0,'data',[0 0 1])
camorbit(30,0,'data',[-1 0 0])

end
Z=A1*A2*A3*A4*A5*A6
end

