function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

	% functie care calculeaza vectorul R folosind metoda
	% Algebraoc
	% citesc din fisier, formez matricea de adiacenta,
	% apoi aflu cate legaturi sunt pe fiecare linie si impart
	% acea linie la nr de legaturi
	% fac matricea transpusa si aplic algoritmul Algebraic
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
	% calculez inversa folosind GS si n SST-uri
	INV = PR_Inv(eye(N) - (d .* Matrix))';
	R = ones(1, N) * (INV .* ((1 - d) / N));
	R = R';
endfunction