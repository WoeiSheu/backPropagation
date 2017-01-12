inputNum = 3;
outputNum = 1;

lower = 2;
higher = 10;

sampleNum = 1000;
testSamples = generateSamples(inputNum,outputNum,sampleNum,lower,higher);
load('network.mat');
[errorSum,testList] = testNetwork(inputNum,outputNum,network,testSamples);
disp(errorSum)

x = 1:sampleNum;
plot(x,testList,'b');
ylim([0,1]);
hold on;
plot(x,0.05,'r');