%% Name: generateNetwork
% author: xu wei
%
% parameters:
% neurons: an array to tell neuron numbers for all layers, example: [3,2,1] represents 3 input, 2 hidden, 1 output
%
% return:
% network: the neural network structure

function network = generateNetwork(neurons)
  disp('You called function generateNetwork')

  network = {};
  layers = length(neurons);
  for(i = 1:layers-1)
    network{1,i} = rand(neurons(i),neurons(i+1));   % initialize network weight with random value
  end

  network;  % this is output
end
