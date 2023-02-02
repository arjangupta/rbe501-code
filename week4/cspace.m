close all; clear; clc;

% ROBOT
link_length1 = 1;
link_length2 = 1;
theta1 = 0;
theta2 = 0;
twolink_robot = rigidBodyTree;
body1 = rigidBody('body1');
jnt1 = rigidBodyJoint('jnt1','revolute');
body2 = rigidBody('body2');
jnt2 = rigidBodyJoint('jnt2','revolute');
dhparams = [link_length1 0 0 theta1
            link_length2 0 0 theta2]; % a alpha d theta
setFixedTransform(jnt1,dhparams(1,:),'dh');
setFixedTransform(jnt2,dhparams(2,:),'dh');
body1.Joint = jnt1;
body2.Joint = jnt2;
addBody(twolink_robot, body1, 'base');
addBody(twolink_robot, body2, 'body1');
% showdetails(twolink_robot);
% ax1 = uiaxes(plot_grid)
% ax1.Properties = ''
config = homeConfiguration(twolink_robot);
config(1).JointPosition = deg2rad(45);
config(2).JointPosition = deg2rad(45);
show(twolink_robot, config);
view(2)
ax = gca;
ax.Projection = 'orthographic';

fig = uifigure('Position',[100 100 600 600]);

grid1 = uigridlayout(fig,[2 1]);

% CSPACE PLOT
plot_panel = uipanel(grid1,"Title", "Configuration Space");
% plot_grid = uigridlayout(plot_panel, [1 1]);
ax2 = uiaxes(plot_panel,"XLim",[0 360],"YLim",[0 360]);
y = 45;
x = 45;
plt = scatter(ax2,x,y,'b+');

% SLIDERS
panel = uipanel(grid1, "Title", "Angle sliders");
slider_grid = uigridlayout(panel, [2 1]);

sld1 = uislider(slider_grid,...
    'Value',45,...
    'Position',[100 50 150 3],...
    'Limits',[0 360],...
    'MajorTicks',[0 45 90 135 180 225 270 315 360],...
    'ValueChangedFcn',@(sld1,event) changeXVal(sld1, plt, twolink_robot, config));

sld2 = uislider(slider_grid,...
    'Value',45,...
    'Position',[100 100 150 3],...
    'Limits',[0 360],...
    'MajorTicks',[0 45 90 135 180 225 270 315 360],...
    'ValueChangedFcn',@(sld1,event) changeYVal(sld1, plt, twolink_robot, config));

function changeYVal(sld, plt, robot, config)
    set(plt,'YData',sld.Value);
    config(2).JointPosition = deg2rad(sld.Value);
    show(robot, config,'PreservePlot',false);
    view(2)
    ax = gca;
    ax.Projection = 'orthographic';
    drawnow;
end

function changeXVal(sld, plt, robot, config)
    set(plt,'XData',sld.Value);
    config(1).JointPosition = deg2rad(sld.Value);
    show(robot, config,'PreservePlot',false);
    view(2)
    ax = gca;
    ax.Projection = 'orthographic';
    drawnow;
end