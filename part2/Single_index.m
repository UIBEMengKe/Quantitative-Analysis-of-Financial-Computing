clear,clc
a=xlsread('�Ͽ�_����HSIndex_����ָ��.xls');  
tickseries=xlsread('�Ͽ�_����HSIndex_����ָ��.xls','HSI','c2:c23');  
ticktimes=x2mdate(xlsread('�Ͽ�_����HSIndex_����ָ��.xls','HSI','b2:b23'));                       
[retseries,retintervals]=price2ret(tickseries,ticktimes);
B=[retseries,retintervals]