clear,clc
Compounding=1;%������Ϣ�淶;
ValuationDate='12-22-2012'%;
StartDate=['12-22-2012';'12-22-2013';'12-22-2014';'12-22-2015';'12-22-2016'];%��ʼ����;
EndDate=['12-22-2013';'12-22-2014';'12-22-2015';'12-22-2016';'12-22-2017'];%��������;
Rates=[0.1;0.11;0.12;0.125;0.09];%
Volatility=[0.2;0.19;0.18;0.17;0.16];%������˵��
CurveTerm = [1;2;3;4;5];
HJMVolSpec = hjmvolspec('Stationary',Volatility,CurveTerm);%����hjmvolspec���������������ʽṹ˵��;
RateSpec=intenvset('Compounding',Compounding,'ValuationDate',ValuationDate,'StartDates',StartDate,'EndDates',EndDate,'Rates',Rates);%�����������޽ṹ˵��;
HJMTimeSpec=hjmtimespec(ValuationDate,EndDate,Compounding);%����ʱ��ṹ˵��;
%����HJMģ�Ͷ�����:
HJMTree=hjmtree(HJMVolSpec,RateSpec,HJMTimeSpec)
treeviewer(HJMTree)
