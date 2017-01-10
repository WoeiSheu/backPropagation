%% Name: excute
% author: xu wei
%

inputNum = 2;
hiddenNum = [3,3];
outputNum = 1;
sampleNum = 1000;
learningRate = 0.02;
iterationNum = 100;

network = generateNetwork([inputNum,hiddenNum,outputNum]);
trainSamples = generateSamples(inputNum,outputNum,sampleNum);

network = trainNetwork(inputNum,outputNum,learningRate,network,trainSamples,iterationNum);    % train

sampleNum = 10;
testSamples = generateSamples(inputNum,outputNum,sampleNum);
errorSum = testNetwork(inputNum,outputNum,network,testSamples);
disp(errorSum)
