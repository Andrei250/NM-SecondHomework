function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1 

	% aflu coeficientii a si b pentru functie astfel incat aceasta
	% sa fie continua. 
	% apoi aflu indicii valorilor din vectorul x care sunt < val1
	% si indicii valorilor din vectorul x care sunt > val2
	% y este un vector pe care il aflu facand a * x + b, iar la final
	% valorile de pe indicii care nu respecta regula le schimb cu 0 sau 1.
	a = 1 / (val2 - val1);
	b = ((-a) * val1);
	y = a * x + b;
	indx0 = x < val1;
	indx1 = x > val2;
	y(indx0) = 0;
	y(indx1) = 1;
endfunction