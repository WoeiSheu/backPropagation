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

function [errorSum,testList] = testNetwork(inputNum,outputNum,network,samples)
  %disp('You called function testNetwork')
  
  [~,layers] = size(network);
  layers = layers+1;
  [row,~] = size(samples);
  
  errorSum = 0;
  testList = zeros(1,row);
  
  for i = 1:row
    input = samples(i,1:inputNum);
    [~,neuronOutput] = getOutput( network, input );
    y = neuronOutput{1,layers};
    actual = samples(i,inputNum+1:inputNum+outputNum);

    outputError = 0.5 * (norm(y - actual))^2;
    errorSum = errorSum + outputError;
    
    testList(i) = sum( abs( (y - actual)./actual ) ) / outputNum;
  end
  
  %errorSum;     % this is output;
end
