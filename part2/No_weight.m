clear,clc;
Multiple_stocks
NumPorts=4
[PortRisk, PortReturn, PortWTs] = portopt(ER,DR,NumPorts);
hold on;
plot(PortRisk,PortReturn,'r*-');
title('��ֵһ������Чǰ���Լ������ʲ���Ϸ���������');
xlabel('���գ���׼�');
ylabel('����������');
hold off;