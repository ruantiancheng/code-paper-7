function [Etau1,Etau2] = model_form_lpf(n,tau,kij)
%MODEL_FORM 此处显示有关此函数的摘要
%   此处显示详细说明
A = [0 1 0;
     0 0 1;
     0 0 -1/tau];
B = [0;0;1/tau]; 
B_ = kron(eye(n),B);
An = zeros(n,n);

infor_num = 2;
for i =1:n
    for j = 1:n
        if j == 1
            if i == 1
                An(i,j) = 0;
            elseif i ==2
                An(i,j) = An(i,j)+1;
            else
                An(i,j) = An(i,j)+1/infor_num;
            end
        elseif  i-j ==1
            An(i,j) =An(i,j)+ 1/infor_num;
        end
    end
end

F = [];
for i = 1:n
    Hi = [];
    for j =1:n
        temp = An(i,j) .* kij(i,:);
        Hi = [Hi temp];
    end    
    F = blkdiag(F,Hi);
end
I3 = eye(3);
I2 = [];
I1 = [];
for i = 1:n
   I2 = blkdiag(I2,I3);
   I1 = [I1,transpose(I3)];
end
I1 = transpose(I1);

E1 = [];
E2 = [];
for i = 1:n
    E1 = blkdiag(E1,I1);
    E2 = [E2,transpose(I2)];
end
E2 = transpose(E2);
Etau1 = kron(eye(n),A);
Etau2 = B_ * F*(E1-E2);
end

