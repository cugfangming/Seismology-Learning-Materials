%P10_4.m
%S波辐射图样，包括SH和SV
%P10_3.m
%Theta方向S波的图型
n=30;
fai=(0:2:2*n)/n*pi;%走向0~2pi
theta=(0:2:2*n)'/n*pi/2;%倾角
costheta=cos(theta);costheta(1)=1;costheta(n+1)=-1;
sintheta=sin(theta);sintheta(1)=0;sintheta(n+1)=0;
cos2theta=cos(2*theta);cos2theta(1)=1;cos2theta(n+1)=1;
sinfai=sin(fai);sinfai(1)=0;sinfai(n+1)=0;
cosfai=cos(fai);cosfai(1)=1;cosfai(n+1)=1;
r=sqrt(abs(cos2theta*cosfai).^2+(costheta*sinfai).^2);
x=r.*(sintheta*cosfai);
y=r.*(sintheta*sinfai);
z=r.*(costheta*ones(1,n+1));
H=surf(x,y,z,r);
set(H,'FaceLighting','phong','FaceColor','interp','AmbientStrength',0.5)
light('Position',[1 0 0],'Style','infinite')
hold on
plot3([-1.5 1.5],[0 0],[0 0]);%画x轴
text(1.5,0,0,'x','FontSize',20)%给出x轴的标记
plot3([0 0],[-2 2],[0 0]);
text(0,2,0,'y','FontSize',20)
plot3([0 0],[0 0],[-1.5 1.5]);
text(0,0,1.5,'z','FontSize',20)
axis off
axis equal
view(176,8)%给出图的视角
hold off
title('S波辐射花样')