clc
clear

z=randn(100,100);
[X,Y]= meshgrid(1:0.25:10,1:0.5:20) ;
%meshgrid needed to form plane in this case
Z= sin(X)+cos(Y);
figure(1)
subplot(2,2,1)
plot(X,Y)
title('X vs Y')
subplot(2,2,2)
plot(X,Z)
title('X vs Z')
subplot(2,2,3)
plot(Y,Z)
title('Y vs Z')
subplot(2,2,4)
surf(X,Y,Z)
title('X vs Y vs Z')
%%
%find eqn of plane containing points & graphs
P=[1,4,0];   % third point is always 0
Q=[3,1,4];
R=[0,-1,6];  %first point is always 0
PQ=Q-P;
PR=R-P;
cross_p=cross(PQ,PR); %cross product of PQ and PR
ispos=(cross_p>=0);  
const=sum(cross_p.*P);
if ispos(1)~=1
    x='-';
elseif ispos(1)~=1
    y='-' ;
elseif ispos(1)~=1
    z='-';
else
    x='';
    y='-';
    z='+';
end 
string= ['The formula for the plane from the points given is ',x,'%ix',y,'%iy',z,'%iz=%i'];
fprintf(string,abs(cross_p(1)),abs(cross_p(2)),abs(cross_p(3)),const)

[PX,QY]=meshgrid(1:0.25:10,1:0.5:20);
RZ=(const-cross_p(1).*PX+cross_p(2).*QY)./cross_p(3);
figure(2)
surf(PX,QY,RZ);