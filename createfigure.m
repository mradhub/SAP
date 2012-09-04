function createfigure

%create figure
figure1 = figure('Position',[1 400 1200 600]);
colormap('gray');
axis square;
R = 0:.002:1;
TH = 2*pi*R;
X = R'*cos(TH);
Y=R'*sin(TH);
Z=log(1+vrosenbrock(X,Y));

%create subplot
subplot1 = subplot(1,2,1,'Parent',figure1);
view([124 34]);
grid('on');
hold('all');

%create surface
surf(X,Y,Z,'Parent',subplot1,'LineStyle','none');

%create contour
contour(X,Y,Z,'Parent',subplot1);

%create subplot
subplot2 = subplot(1,2,2,'Parent',figure1);
view([234 34]);
grid('on');
hold('all')

%create surface
surf(X,Y,Z,'Parent',subplot2,'LineStyle','none');

%create contour
contour(X,Y,Z,'Parent',subplot2);
