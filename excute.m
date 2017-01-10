%% Name: excute
% author: xu wei
%

inputNum = 2;
hiddenNum = 40;
outputNum = 1;
sampleNum = 2000;
learningRate = 0.02;
iterationNum = 2000;

network = generateNetwork([inputNum,hiddenNum,outputNum]);
trainSamples = generateSamples(inputNum,outputNum,sampleNum);

network = trainNetwork(inputNum,outputNum,learningRate,network,trainSamples,iterationNum);    % train

sampleNum = 100;
testSamples = generateSamples(inputNum,outputNum,sampleNum);
errorSum = testNetwork(inputNum,outputNum,network,testSamples);
disp(errorSum)
