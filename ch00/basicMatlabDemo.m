
% 1. where I am?  present working directory, important to search m-file
pwd

% 2. change directory
oldFolder = cd('..')   %  cd .. 
pwd
cd(oldFolder);

% 3. search path (VERY IMPORTANT), you can do it with "menu"
path
addpath(oldFolder);
path
rmpath(oldFolder);
path

% 4. variable, save and store
whos
save backup
clear
whos

load 'backup.mat'
whos

% 5. averything in MATLAB is matrix 
a = [1, 2, 3 ; 4, 5, 6]

a(3,2)  % row vs col
a(2,3)  % row vs col

a(1)    % 2d vs 1d
a(6)    % row vs col

% a(0,0)  % MATLAB is not C, (fortan based history)

% 5. special number 
pi
3 + 2*i
3 - 2*j
a = 1/0    % Inf 
b = a + 100
isinf(b)

a = 0/0    % nan
isnan(a)

% 6. Examine variables
a
whos a
size(a)
length(a)   %  = length(a') 
size(a,1)   % row's 
size(a,2)   % col's

% 7. vectors 
x=1:10
x=1:2:10    % increament = 2
x=10:-1:1   % increment  = -1



% 8. special matrics

o = ones(2,5)
z = zeros(2,5)
e = eye(5)

% 9. Matrix of Matrix 
A=[1 2; 3 4]
B=[5 6; 7 8]
C=[9 10 11 12] 
D= [A B]
E= [A; B]
F = [A B; C]
G=repmat(A,1,2)    % repeat matrix



% 10. operation 
A = [1:3; 4:6]
B = A'
C = A*B
D = A .* B'
x=1:10    % vector operations 
y=sin(pi.*x./2)  %

% 11. relational 
A = -5:4
B = zeros(1,10)
C = A > B
D = A == B

% 12. Logical 
A | B 
A & B


% 13. conditional 
c = 1
d = 0
if  c
    if d
       disp(' case 1')
    end
else
     if ~d
       disp('case 2')
     end 
end
    
% 14. repeat 

i = 0
sum = 0;
while true
    if(i > 10)
       break;
    end
    i = i +1;
    sum = sum +i;
end
sum

a = 1:10
b = 1:10
for i = 1:10
    c(i) = a(i) * b(i); 
end
c

% 15. vectorization  (VERY IMPORTANT!)

c = a .* b
    
% 16. 2-D plot

x = 1: 180
y1 = sin(pi/180*x);
plot(x, y1);
grid;
title('sine(x)');
xlabel('degree');
hold on;
y2 = cos(pi/180*x);
plot(x, y2);


figure; % another window
subplot(2,1,1); plot(x, y1);
title('sin');
grid;
subplot(2,1,2); plot(x, y2);
title('cos');


% 17. problen solving

% solve #1
x = -5:10
whereIs5 = find(x == 5)
x(whereIs5)

% solve linear eqn

A = [1,6; 2, 4];
b = [1, 3]';

% Solve A * x = b
x = A\b
% check the answer with b
A * x 


% 17. m-function 
f = myfunc(2, 4)


% 18 vriable scope in m-function
% see the globaltest.m file 
