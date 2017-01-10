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

function errorSum = testNetwork(inputNum,outputNum,network,samples)
  %disp('You called function testNetwork')
  
  [~,layers] = size(network);
  layers = layers+1;
  [row,~] = size(samples);
  testList = zeros(outputNum,row);
  
  errorSum = 0;
  for i = 1:row
    input = samples(i,1:inputNum);
    [~,neuronOutput] = getOutput( network, input );
    y = neuronOutput{1,layers};
    actual = samples(i,inputNum+1:inputNum+outputNum);

    outputError = 0.5 * (norm(y - actual))^2;
    errorSum = errorSum + outputError;
    
    for j = 1:outputNum
      testList(j,i) = abs(y(j) - actual(j) / actual(j));
    end
  end

  figure(2);
  for j = 1:outputNum
    plot(testList(j));
    hold on;
  end
  
  %errorSum;     % this is output;
end
