%% Name: testNetwork
% author: xu wei
%
% parameters:
% inputNum: input neurons' number
% outputNum: output neurons' number
% network: network structure
% samples: samples
%
% return:
% errorPercentage: error percentage

function errorPercentage = testNetwork(inputNum,outputNum,network,testSamples)
  [row,column] = size(samples);
  rightNum = 0;
  for(i = 1:row)
    input = samples(i:inputNum);
    [neuronInput,neuronOutput] = getOutput( network, input );
    y = neuronOutput{1,layers+1};
    actual = samples(inputNum+1:inputNum+outputNum);

    if( abs(y - actual) < 0.001 )      % if error between expected result and predicted result of neural network is less than 0.001, we think it right.
      rightNum += 1;
    end
  end

  errorNum = row - rightNum;
  errorPercentage = errorNum/row;     % this is output
end
