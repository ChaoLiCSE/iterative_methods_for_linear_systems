%x is the guess. maxIter is the max number of iterations you allow
%tolerance is the desired accuracy


function [x,iterations] = jacobi(A,b,x,maxIter,tolerance)

  n=length(b);
  iterations=maxIter;

  for k = 1:maxIter %each iteration is its own k.
    oldx = x; %store the old x
    x = b;
    for i = 1:n
      for j = 1:i-1
        x(i) = x(i) - A(i,j)*oldx(j);
      end
    
      for j = i+1:n
        x(i) = x(i) - A(i,j)*oldx(j);
      end
      
      x(i)=x(i)/A(i,i);
  end
  
  %check if answer is good enough
  if norm(oldx-x) < tolerance %norm measures the L^2 norm.
    iterations = k;
    break %exits the k for loop
  end

end