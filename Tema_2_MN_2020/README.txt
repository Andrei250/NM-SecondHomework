Dumitrescu Andrei 313CC

Functia Iterative:
	Citesc valorile din fisier si formez matricea de adiacenta.
	Numar cate legaturi sunt pe fiecare linie si impart acea linie
	la valoarea calculata, iar apoi fac M = M' pentru a transpune 
	matricea. Aplic algoritmul iterative pana cand norma diferentei dintre
	vechiul R si noul R este mai mica decat eroarea. Mentionez ca am incercat
	toate variantele de pe forum insa in majoritatea timpului ultimele 3 
	zecimale dau diferit. Primele 3 zecimale dau bine. M-am gandit ca e de la
	faptul ca valorile initiale sunt random, iar eroarea este doar 0.001.
	Am incercat si cu erori mult mai mici si se apropie de rezultatul de la
	Algebraic. Cu valoare de 0.001 primele 3 zecimale dau bine, insa 
	ultimele 3 cateodata sunt bune si cateodata nu si nu am gasit metoda
	care sa dea fix rezultatele acelea. Probabil este de vina si sistemul de
	calcul.

Functia Algebraic:
	Citesc valorile din fisier si formez matricea de adiacenta.
	Numar cate legaturi sunt pe fiecare linie si impart acea linie
	la valoarea calculata, iar apoi fac M = M' pentru a transpune 
	matricea. Calculez inversa lui ( eye(n) - d .* M) cu ajutorul algoritmului
	de descompunere QR, Gram Schmidt si cu ajutorul a n SST-uri pentru fiecare
	coloana in parte. In final il aflu pe R cu ajutorul formulei algebrice.

Functia Apartenenta:
	Aflu coeficientii a si b pentru functie astfel incat aceasta sa fie
	continua. Apoi aflu indicii valorilor din vectorul x care sunt < val1
	si indicii valorilor din vectorul x care sunt > val2.
	y este un vector pe care il aflu facand a * x + b, iar la final
	valorile de pe indicii care nu respecta regula le schimb cu 0 sau 1.

Functia PR_Inv:
	Calculeaza inversa unei matrice folosim algoritmul Gram Schmidt optimizat
	si n SST-uri.

Functia SST:
	Calcuelaza solutiile unui SST.

Functia PageRank:
	Afisez rezultatele functiilor Iterative si Algebraic apoi sortez
	descrestator, cu ajutorul functie build-in sort, vectorul R2 si aplic
	functia Apartenenta asupra sa. La final afisez rezultatele.