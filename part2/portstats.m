clear,clc
Multiple_stocks
Weights=ones(1,4)/4;
[PortRisk, PortReturn]=portstats(ER,DR,Weights);
hold on
plot(PortRisk,PortReturn,'.r')
title('��ֵһ������Чǰ���Լ������ʲ������Ϸ���������')
xlabel('���գ���׼�')
ylabel('����������')
hold off