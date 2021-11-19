function visualizeColony(bacteria,capRadius,ancestor, ~ )
%% This function is used for visualizing colonu
%% If two arguments are entered first one is bacteria, second one is radius
%% And it visualize colony with using orientational color jet,
%% If you put third argument as true, it visualize with respect to type GFP and RFP
if nargin<3
    ancestor = "false";
end
if nargin>3
    bacteria = [bacteria; 1e-8 1e-8 1e-6 0 0];
end
sz=size(bacteria);
hold on;
if ancestor == "true"
    for j=1:sz(1)
        if j == 1
            hold off;
        else
            hold on;
        end
        drawSpheroCylinderWithAncestor(bacteria(j,:),capRadius);
    end
elseif ancestor == "yaxis"
    for j=1:sz(1)
        if j == 1
            hold off;
        else
            hold on;
        end
        drawSpheroCylinderYaxis(bacteria(j,:),capRadius);
    end
else
    for j=1:sz(1)
        if j == 1
            hold off;
        else
            hold on;
        end
        drawSpheroCylinder(bacteria(j,:),capRadius);
    end
end
hold off;
% axis([-8e-5 8e-5 -2e-5 14e-5]);
% axis([-8e-5 8e-5 -8e-5 8e-5]);
axis([-8e-5 8e-5 -8e-5 8e-5]);

aspectRatio = daspect;
daspect(aspectRatio);
set(gcf,'color','w', 'Position', [0 0 600 600]);

axis off;
pause(0.001);

end
