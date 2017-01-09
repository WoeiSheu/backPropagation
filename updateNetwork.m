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
  disp('You called function updateNetwork')

  network = originalNetwork;

  [~,len] = size(originalNetwork);
  for layer = len:-1:1
    [row,column] = size(originalNetwork{1,layer});
    tmp = [];
    for i = 1:row      % previous layer neurons' number
      for j = 1:column
        if(layer == len)    % if it is output layer
          deltaCur = ( neuronOutput{1,layer+1}(j) - actual ) * neuronOutput{1,layer+1}(j) * ( 1 - neuronOutput{1,layer+1}(j) );
        else
          deltaCur = deltaNxt(j,:)'*originalNetwork{1,layer+1}(j,:) * neuronOutput{1,layer+1}(j) * ( 1 - neuronOutput{1,layer+1}(j) );
        end
        tmp(i,j) = deltaCur;
        deltaW = -learningRate * deltaCur * neuronOutput{1,layer}(i);
        network{1,layer}(i,j) = network{1,layer}(i,j) + deltaW;
      end
    end
    deltaNxt = tmp;
  end

  %network;  % this is output
end
