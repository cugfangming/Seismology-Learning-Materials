%P波的辐射图样
%P10_1.m
%0<=theta<=pi为列矢量
n=50;%用的点数
fai=(0:2:2*n)/n*pi;%走向0~2pi
theta=(0:2:2*n)'/n*pi/2;%倾角
costheta=cos(theta);costheta(1)=1;costheta(n+1)=-1;
sintheta=sin(theta);sintheta(1)=0;sintheta(n+1)=0;
sin2theta=sin(2*theta);
sin2theta(1)=0;sin2theta(n+1)=0;
sinfai=sin(fai);sinfai(1)=0;sinfai(n+1)=0;
cosfai=cos(fai);cosfai(1)=1;cosfai(n+1)=1;
r=sin2theta*cosfai;
x=r.*(sintheta*cosfai);
y=r.*(sintheta*sinfai);
z=r.*(costheta*ones(1,n+1));
H=surf(x,y,z,r);
set(H,'FaceLighting','phong','FaceColor','interp','AmbientStrength',0.5)
light('Position',[1 0 0],'Style','infinite')
hold on
plot3([-2 2],[0 0],[0 0]);%画x轴
text(2,0,0,'x','FontSize',20)%给出x轴的标记
plot3([0 0],[-2 2],[0 0]);
text(0,2,0,'y','FontSize',20)
plot3([0 0],[0 0],[-1 1]);
text(0,0,1,'z','FontSize',20)
axis off
axis equal
view(0,0)
hold off
title('P波辐射花样')
