A=xlsread('�Ͽ�_�����������_���ſ�.xls');
TickSeries=xlsread('�Ͽ�_�����������_���ſ�.xls','YRESSTK','c2:c27');
Ticktimes=xlsread('�Ͽ�_�����������_���ſ�.xls','YRESSTK','b2,b27');
[RetSeries,RetIntervals]=price2ret(TickSeries,Ticktimes)