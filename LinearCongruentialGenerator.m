%% Set LCG parameters
Seed = 3;
Multiplier = 2;
Offset = 0;
Modulus = 1000;
NumberOfGeneration = Modulus - 1;
%% Generation
clearvars X U Generated
assert(Seed ~= 0, 'Seed must not be 0');
for i = 1 : NumberOfGeneration 
    if i == 1
        X(i) = mod(Multiplier*Seed+ Offset, Modulus);
    else 
        X(i) = mod(Multiplier*X(i - 1) + Offset, Modulus);
    end
    U(i) = X(i) / Modulus; 
end
Generated = table(X', U', 'VariableNames', {'X', 'U'});