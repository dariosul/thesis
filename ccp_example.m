function ccp_example()
a_4 = [1;2];
x0 = [0;0];
x = [-15:.6:10]';

fx = f(x);
gx = g(x,a_4);

Z = fx - gx;
figure(1)
mesh(x,x,Z);
hold on
contour(x',x',Z)
hold off

figure(2)
mesh(x,x,fx)
hold on 
mesh(x,x,gx)
hold off

affine_gx = affine_g(x,x0,a_4);
figure(3)
mesh(x,x,fx)
hold on 
mesh(x,x,affine_gx)
hold off

CCP = fx-affine_gx;
figure(4)
mesh(x,x,CCP)

end

function F = f(x_)
a_1 = [3; 2];
a_2 = [-6;5];
a_3 = [-4;-7];
[m,~] = size(x_);
F=[];
for i = 1:1:m
    for j = 1:1:m
        x = [x_(j);x_(i)];
        F(i,j) = norm(x-a_1) + norm(x-a_2) + norm(x - a_3);
    end
end
end

function G = g(x_,a_4)
% a_4 = [0.5;1];
[m,~] = size(x_);
G=[];
for i = 1:1:m
    for j = 1:1:m
        x = [x_(j);x_(i)];
        G(i,j) = norm(2*x - a_4);
    end
end
end

function g = grad_g(x,a_4)
% a_4 = [0.5;1];
if (x == ( a_4/2))
    g = [0;0];
else
    g = (2.*x-a_4)/norm(2.*x-a_4);
end
end

function aG = affine_g(x_,x0,a_4)
% a_4 = [0.5;1];
[m,~] = size(x_);
aG = [];
for i = 1:1:m
    for j = 1:1:m
        x = [x_(j);x_(i)];
        aG(i,j) = norm(2.*x0 - a_4) + grad_g(x0,a_4)'*(x - x0);
    end
end
end