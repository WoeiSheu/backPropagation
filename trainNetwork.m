%% Name: trainNetwork
% author: xu wei
%
% parameters:
% inputNum: input neurons' number
% outputNum: output neurons' number
% learningRate: learning rate
% network: network structure
% samples: samples
% iterationNum: max iteration numer
%
% return:
% network: trained network

function network = trainNetwork(inputNum,outputNum,learningRate,network,samples,iterationNum)
  %disp('You called function trainNetwork')
  
  trainList = zeros(1,iterationNum);
  
  [~,layers] = size(network);
  layers = layers+1;
  [row,~] = size(samples);
  for cnt = 1:iterationNum
    rightNum = 0;       % num of right result.(样本正确分类的数�?

    errorSum = 0;
    for i = 1:row
      input = samples(i,1:inputNum);
      [neuronInput,neuronOutput] = getOutput( network, input );
      y = neuronOutput{1,layers};
      actual = samples(i,inputNum+1:inputNum+outputNum);
      
      outputError = 0.5 * (norm(y - actual))^2;
      errorSum = errorSum + outputError;

      network = updateNetwork(network,neuronInput,neuronOutput,actual,learningRate);

      if( outputError < 0.0001 )
          rightNum = rightNum + 1;
      end
    end

    trainList(cnt) = sqrt(errorSum) / row;
    
    if( trainList(cnt) < 0.01 )       % when errorSum < 0.01, stop
      break
    end
  end

  plot(trainList);
  %network;  % this is output
end
