function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eroarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina. 

	% functie care calculeaza vectorul R folosind metoda
	% Iterative
	% citesc din fisier, formez matricea de adiacenta,
	% apoi aflu cate legaturi sunt pe fiecare linie si impart
	% acea linie la nr de legaturi
	% fac matricea transpusa si aplic algoritmul Iterative
	fid = fopen(nume, "r");
	N = fscanf(fid, "%d", 1);
	Matrix = zeros(N);
	L = zeros(1, N);

	for i = 1 : N
		node = fscanf(fid, "%d", 1);
		numberOfNodes = fscanf(fid, "%d", 1);
		lin_e = fscanf(fid, "%d", numberOfNodes);
		Matrix(i, lin_e) = 1;
		Matrix(i, i) = 0;
		L(i) = sum(Matrix(i, lin_e));
		Matrix(i, lin_e) = Matrix(i, lin_e) / L(i);  
	endfor

	val1 = fscanf(fid, "%f", 1);
	val2 = fscanf(fid, "%f", 1);
	fclose(fid);
	Matrix = Matrix';
	R = rand(N, 1);
	R = R ./ norm(R, 1);
	Matrix_hat = (d .* Matrix) + (((1 - d) / N) .* ones(N, N));
	last_R = ones(N, 1) * inf;

	% repet pana cand norma diferentei devine mai mica decat eroarea
	while norm(R - last_R) > eps
		last_R = R;
		R = Matrix_hat * R;
	endwhile

endfunction