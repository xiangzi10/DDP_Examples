figure(1);
subplot(3,1,1)
hold on
plot(time,x_traj(1,:),'linewidth',4);  
plot(time,p_target(1,1)*ones(1,Horizon),'red','linewidth',4)
title('Theta','fontsize',20); 
xlabel('Time in sec','fontsize',20)
hold off;
grid;


subplot(3,1,2);
hold on;
plot(time,x_traj(2,:),'linewidth',4); 
plot(time,p_target(2,1)*ones(1,Horizon),'red','linewidth',4)
title('Theta dot','fontsize',20);
xlabel('Time in sec','fontsize',20)
hold off;
grid;

subplot(3,1,3);hold on
plot(Cost,'linewidth',2); 
xlabel('Iterations','fontsize',20)
title('Cost','fontsize',20);
pos1 = get(gcf,'Position'); % get position of Figure(1) 
set(gcf,'Position', pos1 - [pos1(3)/2,0,0,0]) % Shift position of Figure(1) 

% Visualize inverted pendelum trajectory.
fh = figure();
pos2 = get(gcf,'Position');  % get position of Figure(2) 
set(gcf,'Position', pos2 + [pos1(3)/2,0,0,0]) % Shift position of Figure(2)

x = [0, l1 * sin(xo(1))];
y = [0, -l1 * cos(xo(1))];


h1 = plot(x, y, '-o', 'MarkerSize', 10, 'MarkerFaceColor', 'black',...
    'LineWidth', 2, 'Color', [0, 0, 0]);

t = text(-1.5 * l1, 1.5 * l1, 'Time: 0\Theta: 0');
axis([-2 * l1, 2 * l1, -2 * l1, 2 * l1])

for i = 1:length(x_traj)
  theta = x_traj(1, i);
  t.String = sprintf('Time: %.2fs\nTheta: %.2frad', time(i), theta);
  h1.XData = [0, l1 * sin(theta)];
  h1.YData = [0, -l1 * cos(theta)];
  
  drawnow()  
  pause(dt)
end