function tanhPrime = TanhPrime(x,beta)

tanhPrime = beta*(1-tanh(beta*x).^2);
