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

  lower = 1;
  higher = 10001;
  samples = zeros(num,input+output);
  for i = 1:num
    sampleInput = zeros(1,input);
    for j = 1:input
      sampleInput(j) = lower + (higher-lower) * rand();
    end
    sampleOutput = zeros(1,output);
    for j = 1:output
      sampleOutput(j) = sum( sin(sampleInput) );
    end
    samples(i,:) = [sampleInput sampleOutput];
  end

  %samples;  % this is output
end
