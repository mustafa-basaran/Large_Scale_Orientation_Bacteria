function color=radialOrientationColorJet(bacteria,r)
%%Color jet with respect to radial orientation
x=bacteria(1);
y=bacteria(2);
theta=bacteria(4);
rx=r(1);
ry=r(2);
c=acos(((rx-x)*cos(theta)+(ry-y)*sin(theta))/sqrt((rx-x)^2+(ry-y)^2));
c=abs(pi/2-c);
color=ceil(c*100/(pi/2)+1);
end