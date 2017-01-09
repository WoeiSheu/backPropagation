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

function errorPercentage = testNetwork(inputNum,outputNum,network,samples)
  disp('You called function testNetwork')

  [~,layers] = size(network);
  layers = layers+1;
  [row,~] = size(samples);
  rightNum = 0;
  for i = 1:row
    input = samples(i,1:inputNum);
    [~,neuronOutput] = getOutput( network, input );
    y = neuronOutput{1,layers};
    actual = samples(i,inputNum+1:inputNum+outputNum);

    if( abs(y - actual) < 0.001 )      % if error between expected result and predicted result of neural network is less than 0.001, we think it right.
      rightNum = rightNum+1;
    end
  end

  errorNum = row - rightNum;
  errorPercentage = errorNum/row;     % this is output
end
