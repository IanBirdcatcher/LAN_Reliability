%% Function runTwoParallelLinkSim()
% Parameters
%  K - the number of packets in the application message
%  p - the probability of failure
%  N - the number of simulations to run
%
% Returns: the average number of failures across the total simulations

function result = runTwoParallelLinkSim(K,p,N)

    simResults = ones(1,N); % a place to store the result of each simulation
    
    for i=1:N
        tx1AttemptCount = 0; % transmission count for first link
        tx2AttemptCount = 0; % transmission count for second link
        finalTxAttemptCount = 0; % final transmission count (lowest count between both links)
        pktSuccessCount = 0; % number of packets that have made it across
    
        % Calculate the transmission count for the first link
        while pktSuccessCount < K
            
            r = rand; % generate random number to determine if packet is successful (r > p)
            tx1AttemptCount = tx1AttemptCount + 1; % count 1st attempt
        
            % while packet transmissions is not successful (r < p) for link 1
            while r < p
                r = rand; % transmit again, generate new success check value r
                tx1AttemptCount = tx1AttemptCount + 1; % count additional attempt
            end

            r = rand; % generate random number to determine if packet is successful (r > p)
            tx2AttemptCount = tx2AttemptCount + 1; % Continue counting transmission attempts
        
            % while packet transmissions is not successful (r < p) for link 2
            while r < p
                r = rand; % transmit again, generate new success check value r
                tx2AttemptCount = tx2AttemptCount + 1; % count additional attempt
            end
            
            pktSuccessCount = pktSuccessCount  + 1; % Increment packet success count

             % Determine which link delivered the message with the least transmissions
            if (tx1AttemptCount > tx2AttemptCount) 
                finalTxAttemptCount = tx2AttemptCount;
            else 
                finalTxAttemptCount = tx1AttemptCount;
            end

        end

        simResults(i) = finalTxAttemptCount; % record total number of attempted transmissions before entire application message (K successful packets) transmitted
    end

    result = mean(simResults);
end