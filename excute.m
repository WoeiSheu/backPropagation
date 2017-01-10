%% Name: excute
% author: xu wei
%

inputNum = 3;
hiddenNum = 2;
outputNum = 1;
sampleNum = 1000;
learningRate = 2;

network = generateNetwork([inputNum,hiddenNum,outputNum]);
trainSamples = generateSamples(inputNum,outputNum,sampleNum);

network = trainNetwork(inputNum,outputNum,learningRate,network,trainSamples);    % train

sampleNum = 10;
testSamples = generateSamples(inputNum,outputNum,sampleNum);
errorPercentage = testNetwork(inputNum,outputNum,network,testSamples);
disp(errorPercentage)
