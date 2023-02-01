
fig = uifigure('Position',[100 100 500 315]);

grid1 = uigridlayout(fig,[2 1]);

panel = uipanel(grid1, "Title", "Angle sliders");
slider_grid = uigridlayout(panel, [2 1]);

sld1 = uislider(slider_grid,...
    'Position',[100 50 150 3],...
    'Limits',[0 360],...
    'MajorTicks',[0 45 90 135 180 225 270 315 360],...
    'ValueChangedFcn',@(sld1,event) printValue1(sld1));

sld2 = uislider(slider_grid,...
    'Position',[100 100 150 3],...
    'Limits',[0 360],...
    'MajorTicks',[0 45 90 135 180 225 270 315 360],...
    'ValueChangedFcn',@(sld1,event) printValue1(sld1));

% grid1.ColumnWidth = {220,'1x'};

ax = uiaxes(grid1);
y = 180;
x = 180;
config_space = scatter(ax,x,y,'r+');
% xlim([0 360])
% ylim([0 360])

function printValue1(sld)
    disp(sld.Value)
end