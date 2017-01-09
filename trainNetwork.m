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

    for i = 1:row
      input = samples(i,1:inputNum);
      [neuronInput,neuronOutput] = getOutput( network, input );
      y = neuronOutput{1,layers};
      actual = samples(i,inputNum+1:inputNum+outputNum);
      %outputError = 0.5 * (norm(y - actual)) ^ 2;

      network = updateNetwork(network,neuronInput,neuronOutput,actual,learningRate);

      if( abs(y - actual) < 0.001 )      % if error between expected result and predicted result of neural network is less than 0.001, we think it right.
          rightNum = rightNum + 1;
      end
    end

    trainList(cnt) = (row-rightNum)/row;
    
    if( rightNum / row > 0.99 )       % when 99% of training samples get right results, stop
      break
    end
  end

  plot(trainList);
  %network;  % this is output
end
