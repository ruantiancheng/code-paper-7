function [PP,SS,RR] = lmi_figure(N, h,A,Ad)

% A=[-2 0;0 -0.9];
% Ad=[-1 0;-1 -1];
% N =2
setlmis([]);
R=lmivar(1,[N,1]);
S=lmivar(1,[N,1]);
[P11,~,SP11]=lmivar(1,[N,1]);
[P12,~,SP12]=lmivar(1,[N,1]);
[P13,~,SP13]=lmivar(1,[N,1]);
[P14,~,SP14]=lmivar(1,[N,1]);

[P21,~,SP21]=lmivar(3,SP12');
[P22,~,SP22]=lmivar(1,[N,1]);
[P23,~,SP23]=lmivar(1,[N,1]);
[P24,~,SP24]=lmivar(1,[N,1]);

[P31,~,SP31]=lmivar(3,SP13');
[P32,~,SP32]=lmivar(3,SP23');
[P33,~,SP33]=lmivar(1,[N,1]);
[P34,~,SP34]=lmivar(1,[N,1]);

[P41,~,SP41]=lmivar(3,SP14');
[P42,~,SP42]=lmivar(3,SP24');
[P43,~,SP43]=lmivar(3,SP34');
[P44,~,SP44]=lmivar(1,[N,1]);
[P,~,SP]=lmivar(3,[SP11,SP12,SP13,SP14;SP12',SP22,SP23,SP24;SP12',SP23',SP33,SP34;SP14',SP24',SP34',SP44]);
% % 矩阵描述
% lmiterm([1 1 1 P11],-1,1); 
% 
% lmiterm([1 1 2 P12],-1,1); 
% 
% lmiterm([1 1 3 P13],-1,1); 
% 
% lmiterm([1 1 4 P14],-1,1); 
% 
% lmiterm([1 2 1 -P12],-1,1); 
% 
% lmiterm([1 2 2 P22],-1,1); 
% lmiterm([1 2 2 S],-1/h,1);
% 
% lmiterm([1 2 3 P23],-1,1);
% 
% lmiterm([1 2 4 P24],-1,1); 
% 
% lmiterm([1 3 1 -P13],-1,1); 
% 
% lmiterm([1 3 2 -P23],-1,1); 
% 
% lmiterm([1 3 3 P33],-1,1); 
% lmiterm([1 3 3 S],-3/h,1);
% 
% lmiterm([1 3 4 P34],-1,1); 
% 
% lmiterm([1 4 1 -P14],-1,1);
% 
% lmiterm([1 4 2 -P24],-1,1); 
% 
% lmiterm([1 4 3 -P34],-1,1); 
% 
% lmiterm([1 4 4 P44],-1,1); 
% lmiterm([1 4 4 S],-5/h,1);
% 
% lmiterm([2 1 1 P11],1,A);
% lmiterm([2 1 1 P12],1,1);
% lmiterm([2 1 1 P13],1,1);
% lmiterm([2 1 1 P14],1,1);
% lmiterm([2 1 1 -P11],A',1);
% lmiterm([2 1 1 -P12],1,1);
% lmiterm([2 1 1 -P13],1,1);
% lmiterm([2 1 1 -P14],1,1);
% lmiterm([2 1 1 S],1,1);
% lmiterm([2 1 1 R],h*h*A',A);
% lmiterm([2 1 1 R],-16,1);
% 
% lmiterm([2 1 2 P11],1,Ad);
% lmiterm([2 1 2 P12],-1,1);
% lmiterm([2 1 2 P13],1,1);
% lmiterm([2 1 2 P14],-1,1);
% lmiterm([2 1 2 R],h*h*A',Ad);
% lmiterm([2 1 2 R],-4,1);
% 
% lmiterm([2 1 3 P13],-2,1);
% lmiterm([2 1 3 P12],h*A',1);
% lmiterm([2 1 3 -P22],h,1);
% lmiterm([2 1 3 -P23],h,1);
% lmiterm([2 1 3 -P24],h,1);
% lmiterm([2 1 3 R],20,1);
% 
% lmiterm([2 1 4 P14],-1,1);
% lmiterm([2 1 4 P13],h*A',1);
% lmiterm([2 1 4 P23],h,1);
% lmiterm([2 1 4 -P33],h,1);
% lmiterm([2 1 4 -P34],h,1);
% lmiterm([2 1 4 R],30,1);
% 
% lmiterm([2 1 5 P14],h*A',1);
% lmiterm([2 1 5 P24],h,1);
% lmiterm([2 1 5 P34],h,1);
% lmiterm([2 1 5 -P44],h,1);
% lmiterm([2 1 5 R],70,1);
% 
% lmiterm([2 2 1 -P11],Ad',1);
% lmiterm([2 2 1 P12],-1,1);
% lmiterm([2 2 1 P13],1,1);
% lmiterm([2 2 1 P14],-1,1);
% lmiterm([2 2 1 R],h*h*Ad',A);
% lmiterm([2 2 1 R],-4,1);
% 
% lmiterm([2 2 2 R],h*h*Ad',Ad);
% lmiterm([2 2 2 S],-1,1);
% lmiterm([2 2 2 R],-16,1);
% 
% lmiterm([2 2 3 P12],h*Ad',1);
% lmiterm([2 2 3 -P22],-h,1);
% lmiterm([2 2 3 -P23],h,1);
% lmiterm([2 2 3 -P24],-h,1);
% lmiterm([2 2 3 R],20,1);
% 
% lmiterm([2 2 4 P13],h*Ad',1);
% lmiterm([2 2 4 P23],-h,1);
% lmiterm([2 2 4 -P33],h,1);
% lmiterm([2 2 4 -P34],-h,1);
% lmiterm([2 2 4 R],-30,1);
% 
% lmiterm([2 2 5 P14],h*Ad',1);
% lmiterm([2 2 5 P24],-h,1);
% lmiterm([2 2 5 P34],h,1);
% lmiterm([2 2 5 -P44],-h,1);
% lmiterm([2 2 5 R],70,1);
% 
% lmiterm([2 3 1 -P12],h,A);
% lmiterm([2 3 1 P22],h,1);
% lmiterm([2 3 1 P23],h,1);
% lmiterm([2 3 1 P24],h,1);
% lmiterm([2 3 1 -P13],-2,1);
% lmiterm([2 3 1 R],20,1);
% 
% lmiterm([2 3 2 -P12],h,Ad);
% lmiterm([2 3 2 P22],-h,1);
% lmiterm([2 3 2 P23],h,1);
% lmiterm([2 3 2 P24],-h,1);
% lmiterm([2 3 2 R],20,1);
% 
% lmiterm([2 3 3 P23],-h,2);
% lmiterm([2 3 3 -P23],-h,2);
% lmiterm([2 3 3 R],-40,1);
% 
% lmiterm([2 3 4 P24],-6*h,1);
% lmiterm([2 3 4 -P33],-2*h,1);
% 
% lmiterm([2 3 5 P34],-2*h,1);
% lmiterm([2 3 5 R],-140,1);
% 
% lmiterm([2 4 1 -P13],h,A);
% lmiterm([2 4 1 -P23],h,1);
% lmiterm([2 4 1 P33],h,1);
% lmiterm([2 4 1 P34],h,1);
% lmiterm([2 4 1 -P14],6,1);
% lmiterm([2 4 1 R],30,1);
% 
% lmiterm([2 4 2 -P13],h,Ad);
% lmiterm([2 4 2 -P23],-h,1);
% lmiterm([2 4 2 P33],h,1);
% lmiterm([2 4 2 P34],-h,1);
% lmiterm([2 4 2 R],-30,1);
% 
% lmiterm([2 4 3 P33],-2*h,1);
% lmiterm([2 4 3 -P24],-6*h,1);
% 
% lmiterm([2 4 4 P34],-6*h,1);
% lmiterm([2 4 4 -P34],-6*h,1);
% lmiterm([2 4 4 R],-180,1);
% 
% lmiterm([2 4 5 -P44],-6*h,1);
% 
% lmiterm([2 5 1 -P14],h,A);
% lmiterm([2 5 1 -P24],h,1);
% lmiterm([2 5 1 -P34],h,1);
% lmiterm([2 5 1 P44],h,1);
% lmiterm([2 5 1 R],70,1);
% 
% lmiterm([2 5 2 -P14],h,Ad);
% lmiterm([2 5 2 -P24],-h,1);
% lmiterm([2 5 2 -P34],h,1);
% lmiterm([2 5 2 P44],-h,1);
% lmiterm([2 5 2 R],70,1);
% 
% lmiterm([2 5 3 -P34],-h,2);
% lmiterm([2 5 3 R],-140,1);
% 
% lmiterm([2 5 4 P44],-6*h,1);
% 
% lmiterm([2 5 5 R],-700,1);
% 
% lmiterm([3 1 1 S],-1,1);
% lmiterm([4 1 1 R],-1,1);
% % lmiterm([5 1 1 P33],-1,1);
% % lmiterm([6 1 1 P44],-1,1);
lmiterm([1 1 1 P11],-1,1); 

lmiterm([1 1 2 P12],-1,1); 

lmiterm([1 1 3 P13],-1,1); 

lmiterm([1 1 4 P14],-1,1); 

lmiterm([1 2 1 P21],-1,1); 

lmiterm([1 2 2 P22],-1,1); 
lmiterm([1 2 2 S],-1/h,1);

lmiterm([1 2 3 P23],-1,1);

lmiterm([1 2 4 P24],-1,1); 

lmiterm([1 3 1 P31],-1,1); 

lmiterm([1 3 2 P32],-1,1); 

lmiterm([1 3 3 P33],-1,1); 
lmiterm([1 3 3 S],-3/h,1);

lmiterm([1 3 4 P34],-1,1); 

lmiterm([1 4 1 P41],-1,1);

lmiterm([1 4 2 P42],-1,1); 

lmiterm([1 4 3 P43],-1,1); 

lmiterm([1 4 4 P44],-1,1); 
lmiterm([1 4 4 S],-5/h,1);

lmiterm([2 1 1 P11],1,A);
lmiterm([2 1 1 P12],1,1);
lmiterm([2 1 1 P13],1,1);
lmiterm([2 1 1 P14],1,1);
lmiterm([2 1 1 -P11],A',1);
lmiterm([2 1 1 -P12],1,1);
lmiterm([2 1 1 -P13],1,1);
lmiterm([2 1 1 -P14],1,1);
lmiterm([2 1 1 S],1,1);
lmiterm([2 1 1 R],h*h*A',A);
lmiterm([2 1 1 R],-16,1);

lmiterm([2 1 2 P11],1,Ad);
lmiterm([2 1 2 P12],-1,1);
lmiterm([2 1 2 P13],1,1);
lmiterm([2 1 2 P14],-1,1);
lmiterm([2 1 2 R],h*h*A',Ad);
lmiterm([2 1 2 R],-4,1);

lmiterm([2 1 3 P13],-2,1);
lmiterm([2 1 3 -P21],h*A',1);
lmiterm([2 1 3 -P22],h,1);
lmiterm([2 1 3 -P23],h,1);
lmiterm([2 1 3 -P24],h,1);
lmiterm([2 1 3 R],20,1);

lmiterm([2 1 4 P14],-1,1);
lmiterm([2 1 4 -P31],h*A',1);
lmiterm([2 1 4 -P32],h,1);
lmiterm([2 1 4 -P33],h,1);
lmiterm([2 1 4 -P34],h,1);
lmiterm([2 1 4 R],30,1);

lmiterm([2 1 5 -P41],h*A',1);
lmiterm([2 1 5 -P42],h,1);
lmiterm([2 1 5 -P43],h,1);
lmiterm([2 1 5 -P44],h,1);
lmiterm([2 1 5 R],70,1);

lmiterm([2 2 1 -P11],Ad',1);
lmiterm([2 2 1 P12],-1,1);
lmiterm([2 2 1 P13],1,1);
lmiterm([2 2 1 P14],-1,1);
lmiterm([2 2 1 R],h*h*Ad',A);
lmiterm([2 2 1 R],-4,1);

lmiterm([2 2 2 R],h*h*Ad',Ad);
lmiterm([2 2 2 S],-1,1);
lmiterm([2 2 2 R],-16,1);

lmiterm([2 2 3 -P21],h*Ad',1);
lmiterm([2 2 3 -P22],-h,1);
lmiterm([2 2 3 -P23],h,1);
lmiterm([2 2 3 -P24],-h,1);
lmiterm([2 2 3 R],20,1);

lmiterm([2 2 4 -P31],h*Ad',1);
lmiterm([2 2 4 -P32],-h,1);
lmiterm([2 2 4 -P33],h,1);
lmiterm([2 2 4 -P34],-h,1);
lmiterm([2 2 4 R],-30,1);

lmiterm([2 2 5 -P41],h*Ad',1);
lmiterm([2 2 5 -P42],-h,1);
lmiterm([2 2 5 -P43],h,1);
lmiterm([2 2 5 -P44],-h,1);
lmiterm([2 2 5 R],70,1);

lmiterm([2 3 1 P21],h,A);
lmiterm([2 3 1 P22],h,1);
lmiterm([2 3 1 P23],h,1);
lmiterm([2 3 1 P24],h,1);
lmiterm([2 3 1 -P13],-2,1);
lmiterm([2 3 1 R],20,1);

lmiterm([2 3 2 P21],h,Ad);
lmiterm([2 3 2 P22],-h,1);
lmiterm([2 3 2 P23],h,1);
lmiterm([2 3 2 P24],-h,1);
lmiterm([2 3 2 R],20,1);

lmiterm([2 3 3 P23],-h,2);
lmiterm([2 3 3 -P23],-h,2);
lmiterm([2 3 3 R],-40,1);

lmiterm([2 3 4 P24],-6*h,1);
lmiterm([2 3 4 -P33],-2*h,1);

lmiterm([2 3 5 -P43],-2*h,1);
lmiterm([2 3 5 R],-140,1);

lmiterm([2 4 1 P31],h,A);
lmiterm([2 4 1 P32],h,1);
lmiterm([2 4 1 P33],h,1);
lmiterm([2 4 1 P34],h,1);
lmiterm([2 4 1 -P14],6,1);
lmiterm([2 4 1 R],30,1);

lmiterm([2 4 2 P31],h,Ad);
lmiterm([2 4 2 P32],-h,1);
lmiterm([2 4 2 P33],h,1);
lmiterm([2 4 2 P34],-h,1);
lmiterm([2 4 2 R],-30,1);

lmiterm([2 4 3 P33],-2*h,1);
lmiterm([2 4 3 -P24],-6*h,1);

lmiterm([2 4 4 P34],-6*h,1);
lmiterm([2 4 4 -P34],-6*h,1);
lmiterm([2 4 4 R],-180,1);

lmiterm([2 4 5 -P44],-6*h,1);

lmiterm([2 5 1 P41],h,A);
lmiterm([2 5 1 P42],h,1);
lmiterm([2 5 1 P43],h,1);
lmiterm([2 5 1 P44],h,1);
lmiterm([2 5 1 R],70,1);

lmiterm([2 5 2 P41],h,Ad);
lmiterm([2 5 2 P42],-h,1);
lmiterm([2 5 2 P43],h,1);
lmiterm([2 5 2 P44],-h,1);
lmiterm([2 5 2 R],70,1);

lmiterm([2 5 3 P43],-h,2);
lmiterm([2 5 3 R],-140,1);

lmiterm([2 5 4 P44],-6*h,1);

lmiterm([2 5 5 R],-700,1);

lmiterm([3 1 1 S],-1,1);
lmiterm([4 1 1 R],-1,1);



lmisys=getlmis;
[tmin,xfeas]=feasp(lmisys);
% 
PP=dec2mat(lmisys,xfeas,P);
SS=dec2mat(lmisys,xfeas,S);
RR=dec2mat(lmisys,xfeas,R);
