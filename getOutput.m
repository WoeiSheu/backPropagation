%% Name: getOutput
% author: xu wei
%
% parameters:
% network: network structure
% input: sample input
%
% return:
% neuronInput: all neurons' input
% neuronOutput: all neurons' output

function [neuronInput,neuronOutput] = getOutput(network, input)
  disp("You called function getOutput")

  [wd,layers] = size(network);
  cur = input;
  neuronInput{1,1} = cur;
  for(i = 1:layers)
    neuronOutput{1,i} = cur;
    w = network{1,i};
    z = cur * w;
    neuronInput{1,i+1} = z;
    nxt = 1 ./ (1 + exp(-z));   % activiation function(激活函数)
    cur = nxt;
  end
  neuronOutput{1,layers+1} = cur;

  [neuronInput,neuronOutput];   % this is output
end
