%% IVP definition
Y0 = 1;
YFunction = @(t, y) t*y;
StepSize = 1/4;
Interval = [0, 1];
%% Calculation
T = Interval(1) : StepSize : Interval(2);
W(1) = Y0;
for t = 1 : numel(T) - 1
    S1 = YFunction(T(t), W(t));
    S2 = YFunction(T(t) + 0.5*StepSize, W(t) + 0.5*StepSize*S1);
    S3 = YFunction(T(t) + 0.5*StepSize, W(t) + 0.5*StepSize*S2);
    S4 = YFunction(T(t) + StepSize, W(t) + StepSize*S3);
    W(t + 1) = W(t) + (StepSize/6)*(S1 + 2*S2 + 2*S3 + S4);    
end

