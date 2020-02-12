%����ʧ����Ϊƽ�����
function J = computeCost(X, y, theta)

m = length(y);				% number of training examples
sqrErrors = (X*theta-y).^2;		%squared errors
J = 1/(2*m) * sum(sqrErrors);

end