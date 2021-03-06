function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out

	%Functia creeaza fisierele de output si afiseaza in ele
	%rezultatele functiilor iterative si algebraic
	R1 = Iterative(nume, d, eps);
	R2 = Algebraic(nume, d);
	fid = fopen(nume, "r");
	output = strcat(nume, ".out");
	N = fscanf(fid, "%d", 1);

	for i = 1 : N
		node = fscanf(fid, "%d", 1);
		numberOfNodes = fscanf(fid, "%d", 1);
		lin_e = fscanf(fid, "%d", numberOfNodes);
	endfor

	val1 = fscanf(fid, "%f", 1);
	val2 = fscanf(fid, "%f", 1);
	fclose(fid);
	% afisez rezultatele primelor 2 functii
	fid = fopen(output, "w");
	fprintf(fid, "%d\n", N);
	fprintf(fid, "\n");
	fprintf(fid, "%f\n", R1);
	fprintf(fid, "\n");
	fprintf(fid, "%f\n", R2);
	fprintf(fid, "\n");

	% folosesc functia build-in sort sa imi sorteze descrescator
	% creez o matrice in care stochez pe o linie valorile
	% de output ale functiei algebraic si pe alta pozitiile
	% pe care se afla fiecare pagina initial.
	% Aplic functia Apartenenta pe linia cu valorilerespective
	% apoi afisez valorile din matrice
	indx = 1 : N;
	W = [indx; R2'];
	[~, nr] = sort(W(2, :), 'descend');
	W = W(:, nr);
	W = [indx; W]';
	W = W';
	W(3, :) = Apartenenta(W(3, :), val1, val2);

	fprintf(fid, "%d %d %f\n", W);
	fclose(fid);
endfunction