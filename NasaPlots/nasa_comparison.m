%Nasa 9 coefficients
%-keep in mind a7 is always 0
%
% cp/R = a0*T^-2 + a1*T^-1 + a2 + a3*T + a4*T^2 + a5*T^3 + a6*T^4
% 
%H/RT = (-a0)*T^-2 + a1*ln(T)/T + a2 + a3*T/2 + a4*T^2/3 + a5*T^3/4
%      + a6*T^4/5 + a8/T
%
%S/R = (-a0/2)*T^-2 - a1*T^-1 + a2*ln(T) + a3*T + a4*T^2/2 + a5*T^3/3
%        + a6*T^4/4 + a9
%
%Nasa 7 coefficients with a0, a1, = 0 in the nasa 9 set
%
%cp/R = a2 + a3*T +a 4*T^2 + a5*T^3 + a6*T^4
%
%H/RT = a2 + a3*T/2 + a4*T^2/3 + a5*T^3/4 + a6*T^4/5 + a8/T
%     
%S/R = a2*ln(T) + a3*T + a4*T^2/2 + a5*T^3/3 + a6*T^4/4 + a9
%        
%Comparison for species C



%Nasa 9 coefficients with 200,1000,6000 begin the starting points for the
%temperatures respectively
A200_9 = [-1.189851887E+04 2.151536111E+02 2.730224028E+00 1.806516108E-03 4.984300570E-06 ...
 -5.814567920E-09 1.869689894E-12 0.000000000E+00 2.905755640E+03 1.136772540E+01];

A1000_9 = [6.949606120E+05 -3.656223380E+03 9.604731170E+00 -1.117129278E-03 2.875328019E-07 ...
 -3.626247740E-11 1.808329595E-15 0.000000000E+00 2.543704440E+04 -3.582473720E+01];

A_6000_9 = [ ];
%Nasa 7 coefficients
A200_7 = [0 0 2.77217438E+00 4.95695526E-03 -2.48445613E-06 5.89161778E-10 ...
    -5.33508711E-14 0 4.01191815E+03 9.79834492E+00];

A1000_7 = [0 0 4.22118584E+00 -3.24392532E-03 1.37799446E-05 ...
          -1.33144093E-08 4.33768865E-12 0 3.83956496E+03 3.39437243E+00  ];

%Assigning different matrixes for the cp/R,S/R,H/RT sets of variables for
%the first temperature interval
cpi1= zeros(10,16);
Si1= zeros(10,16);
Hi1= zeros(10,16);

%Setting an initial temperature to evaluate what the coefficients will be
%multiplied by
T=200;

%constructing the different matrixes 
for i = 1:16
    cpi1(1,i)=T^-2;
    cpi1(2,i)=T^-1;
    cpi1(3,i)=1;
    cpi1(4,i)=T;
    cpi1(5,i)=T^2;
    cpi1(6,i)=T^3;
    cpi1(7,i)=T^4;
    Hi1(1,i)=-T^-2;
    Hi1(2,i)=log(T)/T;
    Hi1(3,i)=1;
    Hi1(4,i)=T/2;
    Hi1(5,i)=T^2/3;
    Hi1(6,i)=T^3/4;
    Hi1(7,i)=T^4/5;
    Hi1(9,i)=T^-1;
    Si1(1,i)=-T^-2/2;
    Si1(2,i)=-T^-1;
    Si1(3,i)=log(T);
    Si1(4,i)=T;
    Si1(5,i)=T^2/2;
    Si1(6,i)=T^3/3;
    Si1(7,i)=T^4/4;
    Si1(10,i)=1;
    T=T+50;
end

cp_9_i1=A200_9*cpi1
cp_7_i1=A1000_7*cpi1

figure
x1=[200:50:950];
plot(x1,cp_9_i1,'b',x1,cp_7_i1,'r--')
legend('Nasa^9','Nasa^7')
xlabel('Temperature')
ylabel('Cp/R')
title ('The Two Nasa coefficients for Their First Set of Temperatures')






%Assigning different matrixes for the cp/R,S/R,H/RT sets of variables for
%the first temperature interval
cpi2= zeros(10,100);
Si2= zeros(10,100);
Hi2= zeros(10,100);

%Setting an initial temperature to evaluate what the coefficients will be
%multiplied by
T=1000;

%constructing the different matrixes 
for i = 1:100
    cpi2(1,i)=T^-2;
    cpi2(2,i)=T^-1;
    cpi2(3,i)=1;
    cpi2(4,i)=T;
    cpi2(5,i)=T^2;
    cpi2(6,i)=T^3;
    cpi2(7,i)=T^4;
    Hi2(1,i)=-T^-2;
    Hi2(2,i)=log(T)/T;
    Hi2(3,i)=1;
    Hi2(4,i)=T/2;
    Hi2(5,i)=T^2/3;
    Hi2(6,i)=T^3/4;
    Hi2(7,i)=T^4/5;
    Hi2(9,i)=T^-1;
    Si2(1,i)=-T^-2/2;
    Si2(2,i)=-T^-1;
    Si2(3,i)=log(T);
    Si2(4,i)=T;
    Si2(5,i)=T^2/2;
    Si2(6,i)=T^3/3;
    Si2(7,i)=T^4/4;
    Si2(10,i)=1;
    T=T+50
end

cp_9_i2=A1000_9*cpi2;
cp_7_i2=A200_7*cpi2;

figure
x3=[1000:50:3500];
plot(x3,cp_9_i2(1:51),'b',x3,cp_7_i2(1:51),'r--')
legend('Nasa^9','Nasa^7')
xlabel('Temperature')
ylabel('Cp/R')
title('Showing the Similarness of Nasa7 and 9 up to the Range of 7')

figure 
x2=[3000:50:5950];
plot(x2,cp_9_i2(41:100),'b',x2,cp_7_i2(41:100),'r--')
legend('Nasa^9','Nasa^7')
xlabel('Temperature')
ylabel('Cp/R')
title('Showing the Drop Off of Nasa7 After its Range')





H_9_i1=A200_9*Hi1;
H_7_i1=A1000_7*Hi1;
S_9_i1=A200_9*Si1;
S_7_i1=A1000_7*Si1;
H_9_i2=A1000_9*Hi2;
H_7_i2=A200_7*Hi2;
S_9_i2=A1000_9*Si2;
S_7_i2=A200_7*Si2;


figure

plot(x1,H_9_i1,'b',x1,H_7_i1,'r--')
legend('Nasa^9','Nasa^7')
xlabel('Temperature')
ylabel('H/RT')
title ('The Two Nasa coefficients for Their First Set of Temperatures')


figure

plot(x3,H_9_i2(1:51),'b',x3,H_7_i2(1:51),'r--')
legend('Nasa^9','Nasa^7')
xlabel('Temperature')
ylabel('H/RT')
title('Showing the Similarness of Nasa7 and 9 up to the Range of 7')

figure 

plot(x2,H_9_i2(41:100),'b',x2,H_7_i2(41:100),'r--')
legend('Nasa^9','Nasa^7')
xlabel('Temperature')
ylabel('H/RT')
title('Showing the Drop Off of Nasa7 After its Range')


figure

plot(x1,S_9_i1,'b',x1,S_7_i1,'r--')
legend('Nasa^9','Nasa^7')
xlabel('Temperature')
ylabel('S/R')
title ('The Two Nasa coefficients for Their First Set of Temperatures')

figure

plot(x3,S_9_i2(1:51),'b',x3,S_7_i2(1:51),'r--')
legend('Nasa^9','Nasa^7')
xlabel('Temperature')
ylabel('S/R')
title('Showing the Similarness of Nasa7 and 9 up to the Range of 7')

figure 

plot(x2,S_9_i2(41:100),'b',x2,S_7_i2(41:100),'r--')
legend('Nasa^9','Nasa^7')
xlabel('Temperature')
ylabel('S/R')
title('Showing the Drop Off of Nasa7 After its Range')



