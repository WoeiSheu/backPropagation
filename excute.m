%% Name: excute
% author: xu wei
%

inputNum = 2;
hiddenNum = 36;
outputNum = 1;
learningRate = 0.01;
iterationNum = 2;

lower = 2;
higher = 10;
sampleNum = 2000;
trainSamples = generateSamples(inputNum,outputNum,sampleNum,lower,higher);
sampleNum = 1000;
testSamples = generateSamples(inputNum,outputNum,sampleNum,lower,higher);

figure(1);
network = generateNetwork([inputNum,hiddenNum,outputNum]);
network = trainNetwork(inputNum,outputNum,learningRate,network,trainSamples,iterationNum,testSamples);    % train

sampleNum = 1000;
testSamples = generateSamples(inputNum,outputNum,sampleNum,lower,higher);
[errorSum,testList] = testNetwork(inputNum,outputNum,network,testSamples);
disp(errorSum)

subplot(2,1,2);
x = 1:sampleNum;
plot(x,testList,'b');
ylim([0,1]);
hold on;
plot(x,0.05,'r');