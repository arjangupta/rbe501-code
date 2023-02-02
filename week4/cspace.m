close all; clear;

fig = uifigure('Position',[100 100 600 600]);

grid1 = uigridlayout(fig,[2 1]);

% PLOT
plot_panel = uipanel(grid1,"Title", "Workspace & C-Space");
plot_grid = uigridlayout(plot_panel, [1 2]);
ax = uiaxes(plot_grid,"XLim",[0 360],"YLim",[0 360]);
y = 180;
x = 180;
plt = scatter(ax,x,y,'b+');

% SLIDERS
panel = uipanel(grid1, "Title", "Angle sliders");
slider_grid = uigridlayout(panel, [2 1]);

sld1 = uislider(slider_grid,...
    'Value',180,...
    'Position',[100 50 150 3],...
    'Limits',[0 360],...
    'MajorTicks',[0 45 90 135 180 225 270 315 360],...
    'ValueChangedFcn',@(sld1,event) changeXVal(sld1, plt));

sld2 = uislider(slider_grid,...
    'Value',180,...
    'Position',[100 100 150 3],...
    'Limits',[0 360],...
    'MajorTicks',[0 45 90 135 180 225 270 315 360],...
    'ValueChangedFcn',@(sld1,event) changeYVal(sld1, plt));

function changeYVal(sld, plt)
    set(plt,'YData',sld.Value);
    drawnow;
end

function changeXVal(sld, plt)
    set(plt,'XData',sld.Value);
    drawnow;
end