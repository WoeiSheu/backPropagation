%% Name: generateSamples
% author: xu wei
%
% parameters:
% input: input num
% output: output num
% num: sample num
%
% return:
% samples: samples

function samples = generateSamples(input,output,num)
  %disp('You called function generateSamples')

  lower = 2;
  higher = 10;
  samples = zeros(num,input+output);
  for i = 1:num
    sampleInput = zeros(1,input);
    for j = 1:input
      sampleInput(j) = lower + (higher-lower) * rand();
    end
    sampleOutput = zeros(1,output);
    for j = 1:output
      sampleOutput(j) = sum(log(sampleInput));      % y = sin(x1) + sin(x2) + sin(x3)
    end
    samples(i,:) = [sampleInput sampleOutput];
  end

  %samples;  % this is output
end
