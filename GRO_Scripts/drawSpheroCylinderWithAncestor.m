function drawSpheroCylinderWithAncestor(single_bacteria,radius)
%This function is used for drawing single bacteria as a spherocylinder
center = [0,0];
x=single_bacteria(1);
y=single_bacteria(2);
l=single_bacteria(3);
theta=single_bacteria(4);
n=100; %% n spesifies how many point represents the shape
c=jet(101);
c = [c;0,0,0];
alfa=linspace(theta-pi/2,theta+3*pi/2,n);
x1=x+(l/2)*cos(theta)+radius*cos(alfa(1:n/2));
y1=y+(l/2)*sin(theta)+radius*sin(alfa(1:n/2));
x2=x-(l/2)*cos(theta)+radius*cos(alfa(n/2+1:end));
y2=y-(l/2)*sin(theta)+radius*sin(alfa(n/2+1:end));
color=ancestorColorJet(single_bacteria);
if x == 0 && y == 0
    color = 102;
end
h = fill([x1 x2],[y1 y2],c(color,:));
set(h,'facealpha',.8);
% set(h,'LineWidth',3)

end