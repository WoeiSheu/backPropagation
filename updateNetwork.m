%% Name: updateNetwork
% author: xu wei
%
% parameters:
% originalNetwork: original network
% neuronInput: all neurons' input
% neuronOutput: all neurons' output
% actual: actual label value
% learningRate: learning rate
%
% return:
% network: updated network

function network = updateNetwork(originalNetwork,neuronInput,neuronOutput,actual,learningRate)
  %disp('You called function updateNetwork')

  network = originalNetwork;

  [~,len] = size(originalNetwork);
  for layer = len+1:-1:2
    [row,column] = size(originalNetwork{1,layer-1});
    deltaCur = [];
    for j = 1:column
      o = neuronOutput{1,layer}(j);
      if(layer == len+1)    % if it is output layer
        deltaCur(j) = ( o - actual(j) ) * o * ( 1 - o );
      else
        deltaCur(j) = deltaNxt*originalNetwork{1,layer}(j,:)' * o * ( 1 - o );
      end
    end
    deltaNxt = deltaCur;
    
    for i = 1:row      % previous layer neurons' number
      for j = 1:column
        deltaW = -learningRate * deltaCur(j) * neuronOutput{1,layer-1}(i);
        network{1,layer-1}(i,j) = network{1,layer-1}(i,j) + deltaW;
      end
    end
  end

  %network;  % this is output
end
