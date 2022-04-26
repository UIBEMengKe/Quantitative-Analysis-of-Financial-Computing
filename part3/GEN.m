clc,clear,clf
r=[0.1,0.15,0.12];s=[0.2,0.25,0.18];
ro=[1,0.8,0.4;0.8,1,0.3;0.4,0.3,1];
v=diag(s)*ro*diag(s)%��Э������
x=rand(1000,3);%����1000��1���ڵ������
total=sum(x,2);%���мӺ�
for j=1:3
    x(:,j)=x(:,j)./total;%��һ��
end
expectation=x*r';%��ÿ��Ԥ��������
for j=1:1000
    risk(j)=x(j,:)*v*x(j,:)';%��ÿ��ķ���
end
plot(risk,expectation,'b.')%�Է���Ϊ���ᣬԤ��Ϊ���ᣬ����ɢ��ͼ
x0=[1,1,1]./3;
Aeq=ones(1,3);
beq=1;
f=[];E=[];
X=[]
for i=linspace(0.1,0.15,1000)%��0.1��0.15��ȡ1000�������Ⱦࣩ
    b=i;
    [x,fval]=fmincon(@fun2,x0,-r,-b,Aeq,beq,zeros(3,1),ones(3,1));
    X=[X;x,fval];
    E=[E,x*r'];
    f=[f,fval];
end
hold on
plot(f,E,'r-','linewidth',2)
xlabel('����'),ylabel('������')
title('������յĹ�ϵ')
hold off
