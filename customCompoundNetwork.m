% Ian Fowler, October 2023

% K contains the 5 values of K
K = ([1; 5; 15]);

% Initializes the answerList with sample values
answerList = ones(99,18);


%% Loop section
% loops from 1 percent to 99 percent (incrementing by 1)
% and calculates values from runCustomCompoundNetworkSim with the 3 values of K:
% 1, 5, and 15 for each percentage of probability running 1000
% simulations. Runs for various values of probability based on the
% assignment diagram.
%
% Answers stored in variable answerList according to type: 
% Columns 1-18 are the simulated results. 
for i=1:+1:99
    currentPercentage = i/100;   % Percentage converted to decimal form for math usage

    % Calculate the values for the first figure: p1=10%, p2=60%, p3=1%-99%
    answerList(i,1) = runCustomCompoundNetworkSim(K(1), 0.1, 0.6, currentPercentage, 1000);
    answerList(i,2) =  runCustomCompoundNetworkSim(K(2), 0.1, 0.6, currentPercentage, 1000);
    answerList(i,3) =  runCustomCompoundNetworkSim(K(3), 0.1, 0.6, currentPercentage, 1000); 

    % Calculate the values for the second figure: p1=60%, p2=10%, p3=1%-99%
    answerList(i,4) = runCustomCompoundNetworkSim(K(1), 0.6, 0.1, currentPercentage, 1000);
    answerList(i,5) =  runCustomCompoundNetworkSim(K(2), 0.6, 0.1, currentPercentage, 1000);
    answerList(i,6) =  runCustomCompoundNetworkSim(K(3), 0.6, 0.1, currentPercentage, 1000); 

    % Calculate the values for the third figure: p1=10%, p2=1%-99%, p3=60%
    answerList(i,7) = runCustomCompoundNetworkSim(K(1), 0.1, currentPercentage, 0.6, 1000);
    answerList(i,8) =  runCustomCompoundNetworkSim(K(2), 0.1, currentPercentage, 0.6, 1000);
    answerList(i,9) =  runCustomCompoundNetworkSim(K(3), 0.1, currentPercentage, 0.6, 1000); 

    % Calculate the values for the fourth figure: p1=60%, p2=1%-99%, p3=10%
    answerList(i,10) = runCustomCompoundNetworkSim(K(1), 0.6, currentPercentage, 0.1, 1000);
    answerList(i,11) =  runCustomCompoundNetworkSim(K(2), 0.6, currentPercentage, 0.1, 1000);
    answerList(i,12) =  runCustomCompoundNetworkSim(K(3), 0.6, currentPercentage, 0.1, 1000); 

    % Calculate the values for the fifth figure: p1=1%-99%, p2=60%, p3=10%
    answerList(i,13) = runCustomCompoundNetworkSim(K(1), currentPercentage, 0.1, 0.6, 1000);
    answerList(i,14) =  runCustomCompoundNetworkSim(K(2), currentPercentage, 0.1, 0.6, 1000);
    answerList(i,15) =  runCustomCompoundNetworkSim(K(3), currentPercentage, 0.1, 0.6, 1000); 

    % Calculate the values for the fifth figure: p1=1%-99%, p2=10%, p3=60%
    answerList(i,16) = runCustomCompoundNetworkSim(K(1), currentPercentage, 0.6, 0.1, 1000);
    answerList(i,17) =  runCustomCompoundNetworkSim(K(2), currentPercentage, 0.6, 0.1, 1000);
    answerList(i,18) =  runCustomCompoundNetworkSim(K(3), currentPercentage, 0.6, 0.1, 1000); 
end

%% Figure Section
% Creates a seperate figure for the values of the simulation for each value
% of K. Then creates a figure combining the values of each simulation
% paired with the calculated values.

% First figure
figure('Name','Custom Compound Network Figure 1: p1=10%, p2=60%, p1=1%-99%','NumberTitle','off');
set(gca,'XTickLabel',0:.05:1);
scatter((1:99)/100,answerList(:,1:3))
set(gca, 'yscale', 'log')
legend('K = 1','K = 5','K = 15')
colororder(["#3842cf"; "#b31510"; "#e342db"])

% Second figure
figure('Name','Custom Compound Network Figure 2: p1=60%, p2=10%, p1=1%-99%','NumberTitle','off');
set(gca,'XTickLabel',0:.05:1);
scatter((1:99)/100,answerList(:,4:6))
set(gca, 'yscale', 'log')
legend('K = 1','K = 5','K = 15')
colororder(["#3842cf"; "#b31510"; "#e342db"])

% Third figure
figure('Name','Custom Compound Network Figure 3: p1=10%, p2=1%-99%, p1=60%','NumberTitle','off');
set(gca,'XTickLabel',0:.05:1);
scatter((1:99)/100,answerList(:,7:9))
set(gca, 'yscale', 'log')
legend('K = 1','K = 5','K = 15')
colororder(["#3842cf"; "#b31510"; "#e342db"])

% Fourth figure
figure('Name','Custom Compound Network Figure 4: p1=60%, p2=1%-99%, p1=10%','NumberTitle','off');
set(gca,'XTickLabel',0:.05:1);
scatter((1:99)/100,answerList(:,10:12))
set(gca, 'yscale', 'log')
legend('K = 1','K = 5','K = 15')
colororder(["#3842cf"; "#b31510"; "#e342db"])

% Fifth figure
figure('Name','Custom Compound Network Figure 5: p1=1%-99%, p2=10%, p1=60%','NumberTitle','off');
set(gca,'XTickLabel',0:.05:1);
scatter((1:99)/100,answerList(:,13:15))
set(gca, 'yscale', 'log')
legend('K = 1','K = 5','K = 15')
colororder(["#3842cf"; "#b31510"; "#e342db"])

% Sixth figure
figure('Name','Custom Compound Network Figure 6: p1=1%-99%, p2=60%, p1=10%','NumberTitle','off');
set(gca,'XTickLabel',0:.05:1);
scatter((1:99)/100,answerList(:,16:18))
set(gca, 'yscale', 'log')
legend('K = 1','K = 5','K = 15')
colororder(["#3842cf"; "#b31510"; "#e342db"])
