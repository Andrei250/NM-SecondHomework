function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Se va inlocui aceasta linie cu descrierea algoritmului de inversare

    %Fac descompunere QR folodins Gram-Schmidt optimizat iar apoi fac
    %n SSTuri pentru fiecare coloana pentru a afla inversa  lui A
	[n, m] = size(A);
    Q = A;
    e1 = A(:,1) / norm(A(:,1));
    R = zeros(m, n);
    for k = 1 : n
        R(k, k) = norm(Q(1 : m, k));
        Q(1 : m, k) = Q(1 : m, k) / R(k, k);
        for j = k + 1 : n
            R(k, j) = Q(1 : m, k)' * Q(1 : m, j);
            Q(1 : m, j) = Q(1 : m, j) - Q(1 : m, k) * R(k, j);
        endfor
    endfor
    Q = Q';
    B = zeros(n);

    for i = 1 : n
    	B(:, i) = SST(R, Q(:, i));
    endfor

endfunction