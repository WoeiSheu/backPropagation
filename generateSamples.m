%% Name: generateSamples
% author: xu wei
%
% parameters:
% input: input num
% output: output num
% num: sample num
% lower: lower bound of input
% higher: higher bound of input
%
% return:
% samples: samples

function samples = generateSamples(input,output,num,lower,higher)
  %disp('You called function generateSamples')

  samples = zeros(num,input+output);
  for i = 1:num
    sampleInput = zeros(1,input);
    for j = 1:input
      sampleInput(j) = lower + (higher-lower) * rand();
    end
    sampleOutput = zeros(1,output);
    for j = 1:output
      sampleOutput(j) = sum(log(sampleInput));      % y = log(x1) + log(x2) + log(x3)
    end
    samples(i,:) = [sampleInput sampleOutput];
  end

  %samples;  % this is output
end
