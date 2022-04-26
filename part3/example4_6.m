clear,clc
ExpReturn=[0.1 0.2 0.15];
ExpCovariance=[0.0100 -0.0061 0.0042;
              -0.0061 0.04    -0.0252
              0.0042  -0.0252  0.0225];
Numports=4;          %�ʲ������Чǰ����4����
[PortRisk,PortReturn,PortWts]=frontcon(ExpReturn,ExpCovariance,Numports)
plot(PortRisk,PortReturn,'r*-')