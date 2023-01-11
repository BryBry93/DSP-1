%% Discrete Time Signals
% Project/Lab-1 

%% 1.1) Types of Sequences

% implementing a unit-sample seq: 
% delta(n - n0) ={ 1 when n = n0 & 0 when n != n0

% over n1 <= n0 <= n2

function [x,n] = impseq(n0,n1,n2)
% Generates x(n) = delta(n-n0); n1 <= n <= n2
% -----------
% [x,n] = impseq(n0,n1,n2)
n= [n1:n2];
x = [(n-n0)==0];
end
%[x,n] = impseq(n0,n1,n2)
%% implementing a unit-step seq: 
% u(n - n0) ={ 1 when n >= n0 & 0 when n < n0
% over n1 <= n0 <= n2

function [x,n] = stepseq(n0,n1,n2)
% Generates x(n) = u(n-n0); n1 <= n <= n2
% -----------
% [x,n] = stepseq(n0,n1,n2)
n = [n1:n2];
x = [(n-n0) >= 0];
end

%[x,n] = stepseq(1,0,10)
%% examples
% Generate 𝑥(𝑛) = exp[(2 + 𝑗3)𝑛] 0 ≤ 𝑛 ≤ 10 in Matlab will look like this:
n = [0:10]; 
x = exp((2+3j)*n);

%Generate 𝑥(𝑛) = 3 cos (0.1𝜋𝑛 +𝜋/3) + 2 sin(0.5𝜋𝑛) 0 ≤ 𝑛 ≤ 10 in Matlab will look like this:
n = [0:10]; 
x = 3*cos(0.1*pi*n+pi/3) + 2*sin(0.5*pi*n);

%% Operations on Sequences

% signal addition
function [y,n] = sigadd(x1,n1,x2,n2)
% Implements y(n) = x1(n)+x2(n)
% -----------------------------
% [y,n] = sigadd(x1,n1,x2,n2)
% y = sum sequence over n, which includes n1 and n2
% x1 = first sequence over n1
% x2 = second sequence over n2 (n2 can be different from n1)
n = min(min(n1),min(n2)):max(max(n1),max(n2)); % Duration of y(n)
y1 = zeros(1,length(n)); 
y2 = y1; % Initialization
y1(find((n>=min(n1))&(n<=max(n1))==1))=x1; % x1 with duration of y
y2(find((n>=min(n2))&(n<=max(n2))==1))=x2; % x2 with duration of y
y = y1+y2; % Sequence addition
end
%[y,n] = sigadd(x1,n1,x2,n2)

%% signal multiplication

function [y,n] = sigmult(x1,n1,x2,n2)
% Implements y(n) = x1(n)*x2(n)
% -----------------------------
% [y,n] = sigmult(x1,n1,x2,n2)
% y = product sequence over n, which includes n1 and n2
% x1 = first sequence over n1
% x2 = second sequence over n2 (n2 can be different from n1)
%
n = min(min(n1),min(n2)):max(max(n1),max(n2)); % Duration of y(n)
y1 = zeros(1,length(n));
y2 = y1;
y1(find((n>=min(n1))&(n<=max(n1))==1))=x1; % x1 with duration of y
y2(find((n>=min(n2))&(n<=max(n2))==1))=x2; % x2 with duration of y
y = y1 .* y2; % Sequence multiplication
end
%[y,n] = sigmult(x1,n1,x2,n2)

%%
n = [-5:5];
x = 2*impseq(-2,-5,5) - impseq(4,-5,5);
stem(n,x)
title(’Sequence in Problem 2.1a’)
xlabel(’n’); 
ylabel(;x(n)’);