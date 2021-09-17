%% Set LCG parameters
Seed = 3;
Multiplier = 13;
Offset = 0;
Modulus = 31;
NumberOfGeneration = 35;
%% Generation
assert(Seed ~= 0, 'Seed must not be 0');
for i = 1 : NumberOfGeneration 
    if i == 1
        X(i) = mod(Multiplier*Seed+ Offset, Modulus);
    else 
        X(i) = mod(Multiplier*X(i - 1) + Offset, Modulus);
    end
    Generated(i) = X(i) / Modulus; 
end
