% Ian Fowler, October 2023

% K contains the 5 values of K
K = ([1; 5; 15; 50; 100]);

% Initializes the answerList with sample values
answerList = ones(99,10);

%% Loop section
% loops from 1 percent to 99 percent (incrementing by 1)
% and calculates values from runSingleLinkSim with the 5 values of K:
% 1, 5, 15, 50, and 100 for each percentage of probability running 1000
% simulations. 
%
% Answers stored in variable answerList according to type: 
% Columns 1-5 are the simulated results. 
% Columns 6-10 are the calculated results.
for i = 1:+1:99
   currentPercentage = i/100;   % Percentage converted to decimal form for math usage
   
   % Runs the simulation for each value of K, 1-5
   % j is the counter for K
   for j = 1:+1:5
        answerList(i,j) = runSingleLinkSim(K(j),currentPercentage,1000);

        % Calculating results according to formula: K/(1-p) and storing in
        % columns 6-10 in answerList
        answerList(i,(j + 5)) = K(j)/(1-currentPercentage);
   end
end

%% Figure Section
% Creates a seperate figure for the values of the simulation for each value
% of K. Then creates a figure combining the values of each simulation
% paired with the calculated values.

% colorList contains the hexadecimal values of the five colors that the
% figures will which correspond to the 5 values of K
colorList = (["#3842cf"; "#b31510"; "#e342db"; "#0aa81f"; "#5ff5f2"]);

% legendList contains the strings that correspond to the values of K which
% will be assigned to the legends on each figure.
legendList = (["K = 1"; "K = 5"; "K = 15"; "K = 50"; "K = 100"]);

% figureNameList contains the list of the names of each figure.
figureNameList = (["Single Link K = 1"; "Single Link K = 5"; "Single Link K = 15"; "Single Link K = 50"; "Single Link K = 100"]);

% Loops through each value of K
for j = 1:+1:5
        figure('Name',figureNameList(j),'NumberTitle','off');
        set(gca,'XTickLabel',0:.05:1);
        semilogy((1:99)/100,answerList(:,(j + 5)))     
        hold on
        scatter((1:99)/100,answerList(:,j))
        hold off
        legend(legendList(j))
        colororder(colorList(j))
end

% All K and calculated results included
figure('Name','Single Link All K','NumberTitle','off');
set(gca,'XTickLabel',0:.05:1);
semilogy((1:99)/100,answerList(:,6:10))     
hold on
scatter((1:99)/100,answerList(:,1:5))
hold off
legend('K = 1','K = 5','K = 15','K = 50','K = 100')
colororder(["#3842cf"; "#b31510"; "#e342db"; "#0aa81f"; "#5ff5f2"])

