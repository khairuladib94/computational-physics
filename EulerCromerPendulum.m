function EulerCromerPendulum(Interval, InitialAngle, InitialVelocity, NumPoints)

StepSize = diff(Interval) / NumPoints;   
Angle(1) = InitialAngle;
AngularVelocity(1) = InitialVelocity;
Time(1) = Interval(1);
GravitationalAcceleration = 9.81;
PendulumLength = 1;

figure;
tiledlayout(gcf, 1, 2);
PendulumAxes = nexttile;
GraphAxes = nexttile;
set(PendulumAxes, XLim = [-1.2 1.2], YLim = [-1.2 1.2], XTick = [-1 0 1], YTick = [-1 0 1], ...
    Color = 'none', Box = true);

PendulumBob = animatedline(PendulumAxes, Color = 'r', Marker = '.', MarkerSize = 40);
PendulumRod = animatedline(PendulumAxes, Color = 'k', LineStyle = '-', LineWidth = 3);
axis square             

for i = 1 : NumPoints
    Time(i + 1) = Time(i) + StepSize;
    AngularVelocity(i + 1) = AngularVelocity(i) + StepSize * ...
        (-GravitationalAcceleration / PendulumLength) * sin(Angle(i));
    Angle(i + 1, :) = Angle(i) + StepSize * AngularVelocity(i + 1);
    
    XBob = sin(Angle(i + 1));
    YBob = -cos(Angle(i + 1));
    XRod = [0 XBob]; 
    YRod = [0 YBob];
    
    clearpoints(PendulumBob); addpoints(PendulumBob, XBob, YBob);
    clearpoints(PendulumRod); addpoints(PendulumRod, XRod, YRod);
     
    plot(GraphAxes, Time, Angle);  
    set(GraphAxes, XLim = Interval, YLim = [-2 2]);
    xlabel 'Time (s)'
    ylabel Amplitude
    drawnow;
    pause(StepSize);
end

end