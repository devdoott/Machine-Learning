% 0 malignant/cancerous
% 1 normal
nI = 307;
nH = 4;
nF = 8;
%avgError = zeros(18,1);
avgError = 0;
%for nH = 1:18
    %x = zeroes(nI,nF);
    x = xlsread('features_train.xlsx', 4);
    x=x';
    %d = zeroes(nI,1);
    d = xlsread('features_train.xlsx', 3);
    d=d';
    % for i=1:nI
    %     for j=1:nF
    %         x(i,j)=data{i,j};
    %     end
    %     d(i,1)=output{i,1};
    % end
    net=newff(x,d,nH);
    net=train(net,x,d);
    output=net(x);
    error=output-d;
  %  avgError(nH)=0;
    for i=1:nI
        avgError=avgError+abs(error(i));
    end
    avgError=avgError/nI;
%end