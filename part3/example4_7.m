clear,clc
m=[0.1 0.3];
c=[0.02 0
    0 0.04];
p=Portfolio;%����Portfolio���󡪡�p
p=Portfolio(p,'assetmean',m,'assetcovar',c);%���Ը�ֵ
p=Portfolio(p,'lowerbudget',1,'upperbudget',1);%lowerbudget����Ԥ��Լ�����ݣ�
p=Portfolio(p,'lowerbound',0);
plotFrontier(p)