clear variables, close all

a_1 = [-5 -13]';
a_2 = [-12 1]';
a_3 = [-1 -5]';
a_4 = [-9 -12]';
a_5 = [-3 -12]';

Am = [a_1 a_2 a_3 a_4 a_5];

x_s = [-5 -11]';

d = [11.8829 0.1803 4.6399 11.2402 10.8183];

figure
for i = 1:length(d)
%% hyperbola parameters
a = d(i)/2;
c = norm(Am(:,i))/2;
b = sqrt(c^2 - a^2);
phi_rad = atan(Am(2,i)/Am(1,i));


points = create_hyperbola( a,b,phi_rad,Am(1,i)/2,Am(2,i)/2,1,300);

plot(points(1,:), points(2,:))
hold on
plot(points(3,:), points(4,:))
hold on

plot(Am(1,i), Am(2,i),'ro')
hold on


%%% define the x-space
%xmin = 4;
%xmax = 5;
%
%% convert in t-space
%tmin = acosh(xmin/a);
%tmax = acosh(xmax/a);
%
%% hyperbola computation
%t = linspace(-tmin,tmax,10);
%x = a*cosh(t) + 0;
%y = b*sinh(t) + 0;
%
%
%% plot
% set(gcf,'color',[1 1 1])
%plot(x,y,'b-o','linewidth',3,'markersize',10,'markerfacecolor',[1 1 1])
%hold on
%%plot(-x,y,'r-o','linewidth',3,'markersize',10,'markerfacecolor',[1 1 1])
%xlabel('x coordinate','fontsize',18)
%ylabel('y coordinate','fontsize',18)
%set(gca,'fontsize',18)

grid on
hold on
end

plot(x_s(1), x_s(2),'k>')
hold on

pause

