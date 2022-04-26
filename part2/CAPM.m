clear,clc
[num,str,all]=xlsread('Report_02.xlsx');%��ȡ[��ֵ�ͣ��ַ���������]����
p1=num(:,2);p2=num(:,3);p3=num(:,4); %��num�������ȡ��ֻ��Ʊ�����̼�
[r1]=price2ret(p1);[r2]=price2ret(p2);[r3]=price2ret(p3); %�����̼�ת����������
rm=num(2:244,5);rf=num(2:244,6);%��num�������ȡ�г�����������ʺ����޷���������
S=[r1,r2,r3,rm,rf];%����ֻ��Ʊ��������+�г������������+���޷��������ʵ���S������
name=str(1,3:5);%��str�ж�ȡ��Ʊ����
[numsamples,numseries]=size(S);%����S�Ľṹ
numname=numseries-2;%��Ʊ���Ƹ���=S������-2���г������������+���޷��������ʣ�
dates=x2mdate(num(2:244,1));%��ȡnum�еĹ�Ʊ��������
startdate=dates(1);%��ȡdate�еĵ�һ������Ϊ��ʼ����
enddate=dates(end);%��ȡdate�е����һ������Ϊ��������
%������д���ı��ļ���ʹ��fprintf����
fprintf(1,'Separate regressions with ');%����Separate regressions with
fprintf(1,'daily total return S from %s to %s\n',...
datestr(startdate,1),datestr(enddate,1));%����daily total return S from 04-Jan-2017 to 29-Dec-2017��������
fprintf(1,'%17s % -20s % -20s % -20s %  ',' ','Alpha','Beta','Sigma');%����Alpha Alpha Sigma�����λ��
fprintf(1,'\n');%����һ��
fprintf(1,'********    *****************   ******************   ****************** ','\n');%��*�ֽ��������
fprintf(1,'\n');%����һ��
%�����������ֵ
for i=1:numname %i=1:3
    testS=zeros(numsamples,1);%�����ַ��������������е�������
    testdesign=zeros(numsamples,2);%�����ַ������������������е������
    testS(:)=S(:,i)-S(:,5);%ri-rf
    testdesign(:,1)=1;%��rm-rf���ĳ�����Ϊ1
    testdesign(:,2)=S(:,4)-S(:,5);%rm-rf
    [Param,Covar]=ecmmvnrmle(testS,testdesign);%�ԣ�ri-rf���ͣ�rm-rf������Ԫ��̬�ع飬���ز�����Э����
    [StdParam,Stdcovar]=ecmmvnrstd(testS,testdesign,Covar,'fisher');%ʹ�á�Fisher��Ϣ����������Ԫ��̬�ع�ģ�͵ı�׼�����������ֵ
     StdParam=ecmmvnrstd(testS,testdesign,Covar,'hessian');%ʹ�á��۲쵽�Ķ�����Ȼ������Ԥ��Hessian����������Ԫ��̬�ع�ģ�͵ı�׼�����������ֵ
     Alpha=Param(1);%Alpha��Param�еĵ�һ����
     Beta=Param(2);%Beta��Param�еĵڶ�����
     Sigma=sqrt(Covar);%����Э�����ƽ������Sigma
     StdAlpha=StdParam(1);%StdAlpha��StdParam�ĵ�һ����
     StdBeta=StdParam(2);%Beta��StdParam�ĵڶ�����
     StdSigma=sqrt(Stdcovar);%����Э�����׼���ƽ��
     %��Alpha Beta Sigma�Ȳ�������ֵ�����λ�ý��б༭
     fprintf('%4s %9.4f (%8.4f) %9.4f (%8.4f) %9.4f (%8.4f)\n',...
     name{i},Alpha(1),abs(Alpha(1)/StdAlpha(1)),...
     Beta(1),abs(Beta(1)/StdBeta(1)),Sigma(1),StdSigma(1));
end