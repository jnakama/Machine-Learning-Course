function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%



testVals = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
updatedError = 1
cTemp = C;

sigmaTemp = sigma;

len = size(testVals,2);

for i = 1:len
  for j = 1:len
    C = testVals(i); 
    sigma = testVals(j);
    
    %train and get predictions of model using each value of C and sigma
    model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));  
    predictions = svmPredict(model, Xval);
    
    %compare predicted value from trained model with CV value
    error = mean(double(predictions ~= yval))
    
    %check if updatedError is smaller than current error, if so update
    if error < updatedError,
      cTemp = C;
      sigmaTemp = sigma;
      updatedError = error;
    end
  end
end  

C = cTemp;
sigma = sigmaTemp;



% =========================================================================

end
