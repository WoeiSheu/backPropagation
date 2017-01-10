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
  %disp('You called function testNetwork')

  [~,layers] = size(network);
  layers = layers+1;
  [row,~] = size(samples);
  rightNum = 0;
  errorSum = 0;
  for i = 1:row    
    input = samples(i,1:inputNum);
    [~,neuronOutput] = getOutput( network, input );
    y = neuronOutput{1,layers};
    actual = samples(i,inputNum+1:inputNum+outputNum);

    outputError = 0.5 * (norm(y - actual))^2;
    errorSum = errorSum + outputError;
      
    if( outputError < 0.0001 )
      rightNum = rightNum+1;
    end
  end

  disp(errorSum);
  errorNum = row - rightNum;
  errorPercentage = errorNum/row;     % this is output
end
