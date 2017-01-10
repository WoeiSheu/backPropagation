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
  sampleNum = 1000;
  testSamples = generateSamples(inputNum,outputNum,sampleNum);
  
  trainList = zeros(1,iterationNum);
  testList = zeros(1,iterationNum);
  
  [~,layers] = size(network);
  layers = layers+1;
  [row,~] = size(samples);
  for cnt = 1:iterationNum
    errorSum = 0;
    for i = 1:row
      input = samples(i,1:inputNum);
      [neuronInput,neuronOutput] = getOutput( network, input );
      y = neuronOutput{1,layers};
      actual = samples(i,inputNum+1:inputNum+outputNum);
      
      outputError = 0.5 * (norm(y - actual))^2;
      errorSum = errorSum + outputError;

      network = updateNetwork(network,neuronInput,neuronOutput,actual,learningRate);
    end

    %trainList(cnt) = sqrt(errorSum);
    trainList(cnt) = errorSum;
    cnt,errorSum
    
    [testErrorSum,~] = testNetwork(inputNum,outputNum,network,testSamples);
    testErrorSum
    testList(cnt) = testErrorSum;
    
    if( errorSum < 0.1 )       % when errorSum < 1, stop
      break
    end
  end

  figure(1);
  subplot(2,1,1);
  plot(trainList,'r');
  hold on;
  plot(testList,'b');
  %network;  % this is output
end
