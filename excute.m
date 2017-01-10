%% Name: excute
% author: xu wei
%

inputNum = 2;
hiddenNum = 36;
outputNum = 1;
sampleNum = 2000;
learningRate = 0.01;
iterationNum = 1000;

network = generateNetwork([inputNum,hiddenNum,outputNum]);
trainSamples = generateSamples(inputNum,outputNum,sampleNum);

network = trainNetwork(inputNum,outputNum,learningRate,network,trainSamples,iterationNum);    % train

sampleNum = 1000;
testSamples = generateSamples(inputNum,outputNum,sampleNum);
[errorSum,testList] = testNetwork(inputNum,outputNum,network,testSamples);
disp(errorSum)

subplot(2,1,2);
x = 1:sampleNum;
plot(x,testList,'b');
ylim([0,1]);
hold on;
plot(x,0.05,'r');