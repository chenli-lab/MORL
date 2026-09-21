clc,clear all
rng('shuffle');
tic
alpha=0.1;
gamma=0.9;
epsilon=0.01;
r=0.000;
W=0:0.02:1;
N_max=2;
t_max=1*10^8;
low=0.3;
m=0.5;
high=0.8;
T=3*10^7;
reward = [low, m, high];
states = [1, 2, 3; 4, 5, 6; 7, 8, 9]; 
PDF_p=zeros(3,length(W));
PDF_q=zeros(3,length(W));
for ii=1:length(W)
    w=W(ii);
    action_r1=zeros(N_max,T);
    action_r2=zeros(N_max,T);
    for n = 1:N_max
        Q1_R = rand(9, 3);
        Q1_F = rand(9, 3);
        Q2_R = rand(9, 3);
        Q2_F = rand(9, 3);
        Q1 = (1 - w) * Q1_R + w * Q1_F;
        Q2 = (1 - w) * Q2_R + w * Q2_F;
        action_1 = randi(3);
        action_2 = randi(3);
        
        for j = 1:t_max
            s1 = states(action_1, action_2);
            s2 = states(action_2, action_1);
            
            % 判断动作
            if rand < epsilon
                action_1 = randi(3);
            else
                ap1 = find(Q1(s1, :) == max(Q1(s1, :)));
                action_1 = ap1(randi(length(ap1)));
            end
            
            if rand < epsilon
                action_2 = randi(3);
            else
                ar2 = find(Q2(s2, :) == max(Q2(s2, :)));
                action_2 = ar2(randi(length(ar2)));
            end
            
            r1 = reward(action_1);
            r2 = reward(action_2);
            
            r_r1 = (r1 >= r2) * (1 - r1);
            r_r2 = (r1 >= r2) * r1;
            r_f1 = (r_r1 == r_r2) * r;
            r_f2 = (r_r1 == r_r2) * r;
            
            s1_new = states(action_1, action_2);
            s2_new = states(action_2, action_1);
            
            Q1_R(s1, action_1) = (1 - alpha) * Q1_R(s1, action_1) + alpha * (r_r1 + gamma * max(Q1_R(s1_new, :)));
            Q2_R(s2, action_2) = (1 - alpha) * Q2_R(s2, action_2) + alpha * (r_r2 + gamma * max(Q2_R(s2_new, :)));
            Q1_F(s1, action_1) = (1 - alpha) * Q1_F(s1, action_1) + alpha * (r_f1 + gamma * max(Q1_F(s1_new, :)));
            Q2_F(s2, action_2) = (1 - alpha) * Q2_F(s2, action_2) + alpha * (r_f2 + gamma * max(Q2_F(s2_new, :)));
            
            Q1(s1, action_1) = (1 - w) * Q1_R(s1, action_1) + w * Q1_F(s1, action_1);
            Q2(s2, action_2) = (1 - w) * Q2_R(s2, action_2) + w * Q2_F(s2, action_2);
        end
        
        for j = 1:T
            s1 = states(action_1, action_2);
            s2 = states(action_2, action_1);
            
            % 判断动作
            if rand < epsilon
                action_1 = randi(3);
            else
                ap1 = find(Q1(s1, :) == max(Q1(s1, :)));
                action_1 = ap1(randi(length(ap1)));
            end
            
            if rand < epsilon
                action_2 = randi(3);
            else
                ar2 = find(Q2(s2, :) == max(Q2(s2, :)));
                action_2 = ar2(randi(length(ar2)));
            end
            
            r1 = reward(action_1);
            r2 = reward(action_2);
            
            r_r1 = (r1 >= r2) * (1 - r1);
            r_r2 = (r1 >= r2) * r1;
            r_f1 = (r_r1 == r_r2) * r;
            r_f2 = (r_r1 == r_r2) * r;
            
            s1_new = states(action_1, action_2);
            s2_new = states(action_2, action_1);
            
            Q1_R(s1, action_1) = (1 - alpha) * Q1_R(s1, action_1) + alpha * (r_r1 + gamma * max(Q1_R(s1_new, :)));
            Q2_R(s2, action_2) = (1 - alpha) * Q2_R(s2, action_2) + alpha * (r_r2 + gamma * max(Q2_R(s2_new, :)));
            Q1_F(s1, action_1) = (1 - alpha) * Q1_F(s1, action_1) + alpha * (r_f1 + gamma * max(Q1_F(s1_new, :)));
            Q2_F(s2, action_2) = (1 - alpha) * Q2_F(s2, action_2) + alpha * (r_f2 + gamma * max(Q2_F(s2_new, :)));
            
            Q1(s1, action_1) = (1 - w) * Q1_R(s1, action_1) + w * Q1_F(s1, action_1);
            Q2(s2, action_2) = (1 - w) * Q2_R(s2, action_2) + w * Q2_F(s2, action_2);
            action_r1(n, j) = action_1;
            action_r2(n, j) = action_2;
            
        end  
    end
    action1=action_r1(:);
    action2=action_r2(:);
    a=tabulate(action1);
    b=tabulate(action2);
    PDF_p(a(:,1),ii)=a(:,3);
    PDF_q(b(:,1),ii)=b(:,3);
    clear action_r1 action_r2 action1 action2 a b
    clear Q1_R Q1_F Q2_R Q2_F Q1 Q2
    clear action_1 action_2 s1 s2 s1_new s2_new
    clear r1 r2 r_r1 r_r2 r_f1 r_f2
end
