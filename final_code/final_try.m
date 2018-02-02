clear;clc;close all;
rosshutdown
rosinit('localhost')
rostopic list
% * Set a variable |velocity| to use for a brief TurtleBot movement.
velocity = 0.1;     % meters per second
%%
robot = rospublisher('/mobile_base/commands/velocity');
velmsg = rosmessage(robot);
velmsg.Linear.X = velocity;
send(robot,velmsg);
odom = rossubscriber('/odom');
odomdata = receive(odom,3);
pose = odomdata.Pose.Pose;
x = pose.Position.X;
y = pose.Position.Y;
z = pose.Position.Z;
[x,y,z]  
quat = pose.Orientation;
angles = quat2eul([quat.W quat.X quat.Y quat.Z]);
theta = rad2deg(angles(1));