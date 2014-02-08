;=====================================================================
;
;	extern int enigma(char *intxt, char *outtxt, struct 	
;		EnigmaStruct * en);
;
;=====================================================================
section .data
	initpos1 db 0
	initpos2 db 0
	initpos3 db 0
	obrot1 db 0
	obrot2 db 0
	obrot3 db 0
	przesuniecie1 db 0
	przesuniecie2 db 0
	przesuniecie3 db 0
	
section	.text
global  enigma

enigma:
	; prolog
	push	ebp
	mov	ebp, esp
	; koniec prologu

;.zaladowanie_lokalnych:

	

.przepisanie_tablicy_do_tablicy:
	mov eax, [esp+8]	; laduje adres *intxt
	mov ecx, [esp+12]	; laduje adres *outtxt

.petla_wczytujaco_zapisujaca1:
	; petla ta powinna przepisac intxt do outtxt z pominieciem 
	mov edx, 0
	mov dl, [eax]		; dl = intxt[i]
	cmp dl, 10 		; czy koniec wiersza '\n'
	je .przepisz
	cmp dl, 32		; czy bialy znak, inny od '\n'
	jb .koniec_petli1
	cmp dl, 95		; czy liczba powyzej dec95, poza zalozonym przedzialem
	ja .pomin
	jmp .szyfruj

.szyfruj:
	;PUSH ecx
	jmp .praca_enigmy
	.koniec_pracy_enigmy:
	;POP ecx
.przepisz:
	mov [ecx], dl		; outtxt[i] = dl
.pomin:
.zwieksz_index_petli1:
	add eax,1		;przesuwamy indeks tablicy
	add ecx,1
	jmp .petla_wczytujaco_zapisujaca1
.koniec_petli1:
	jmp .konczenie_funkcji

.konczenie_funkcji:

	mov	eax, 0			;return 0
	pop	ebp
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.praca_enigmy:
	;; w dl mamy znak do zaszyfrowania
	sub dl, 32		; konwersja ascii do indexu
.beben3:

	
	;; trzeba przesunac index
	push ecx
	push ebx
		mov ebx, [esp+24]	; //poczatek struktury
		add ebx, 904		; ebx wskazuje na initpos3
		mov ecx, 0		; czyszcze sobie ecx
		mov ecx, DWORD[ebx]	; cl = initpos3
		add edx, ecx		; zwieksz index o initpos3
		cmp edx, 0		; jesli wyszlo poza zakres
		jnl .ominkorekte3		; to trzeba skorygowac
		add edx, 64
		.ominkorekte3:
		cmp edx, 63		
		jle .ominkorekte33
		sub edx, 64
		.ominkorekte33:
	pop ebx
	pop ecx


	
	shl edx, 2		; index*4 bo inty

	mov ebx, [esp+16]	; laduje adres *rotor1 (inty) ; a w zasadzie na strukture
	add ebx, 512		; ebx wskazuje na *rotor3
	add ebx, edx		; przesuniecie na tablicy rotor3
	mov dl, byte [ebx]	; dl = rotor3[indexdl] 

	
.beben2:
	;; trzeba przesunac index
	push ecx
	push ebx
		mov ebx, [esp+24]	; //poczatek struktury
		add ebx, 904		; ebx wskazuje na initpos3
		mov ecx, 0		; czyszcze sobie ecx
		mov ecx, DWORD[ebx]	; cl = initpos3
		sub edx, ecx		; zmniejsz index o initpos3
		sub ebx, 4		; ebx wskazuje na initpos2
		mov ecx, 0
		mov ecx, DWORD[ebx]	;ecx = initpos2
		add edx, ecx		; zwieksz index o initpos2
		cmp edx, 0		; jesli wyszlo poza zakres
		jnl .ominkorekte2	; to trzeba skorygowac
		add edx, 64
		.ominkorekte2:
		cmp edx, 63		
		jle .ominkorekte22	
		sub edx, 64
		.ominkorekte22:
	pop ebx
	pop ecx

	

	



	shl edx, 2		; index*4 bo inty
	mov ebx, [esp+16]	; laduje adres *rotor1 (inty) ; a w zasadzie na strukture
	add ebx, 256		; ebx wskazuje na *rotor2
	add ebx, edx		; przesuniecie na tablicy rotor2
	mov dl, byte [ebx]	; dl = rotor2[indexdl] 


.beben1:
	;; trzeba przesunac index
	push ecx
	push ebx
		mov ebx, [esp+24]	; //poczatek struktury
		add ebx, 900		; ebx wskazuje na initpos2
		mov ecx, 0		; czyszcze sobie ecx
		mov ecx, DWORD[ebx]	; cl = initpos2
		sub edx, ecx		; zmniejsz index o initpos2
		sub ebx, 4		; ebx wskazuje na initpos1
		mov ecx, 0
		mov ecx, DWORD[ebx]	;ecx = initpos1
		add edx, ecx		; zwieksz index o initpos1
		cmp edx, 0		; jesli wyszlo poza zakres
		jnl .ominkorekte1	; to trzeba skorygowac
		add edx, 64
		.ominkorekte1:
		cmp edx, 63		
		jle .ominkorekte11	
		sub edx, 64
		.ominkorekte11:
	pop ebx
	pop ecx
	

	


	shl edx, 2		; index*4 bo inty
	mov ebx, [esp+16]	; laduje adres *rotor1 (inty) ; a w zasadzie na strukture
	;add ebx, 512		; ebx wskazuje na *rotor1
	add ebx, edx		; przesuniecie na tablicy rotor1
	mov dl, byte [ebx]	; dl = rotor1[indexdl] 


.bebenodwr:
	mov ebx, [esp+16]	; laduje adres *rotor1 (inty) ; a w zasadzie na strukture

	;; trzeba przesunac index
	push ecx
	push ebx
		mov ebx, [esp+24]	; //poczatek struktury
		add ebx, 896		; ebx wskazuje na initpos1
		mov ecx, 0		; czyszcze sobie ecx
		mov ecx, DWORD[ebx]	; cl = initpos1
		sub edx, ecx		; zmniejsz index o initpos1
		cmp edx, 0		; jesli wyszlo poza zakres
		jnl .ominkorekteodwr	; to trzeba skorygowac
		add edx, 64
		.ominkorekteodwr:
		cmp edx, 63		
		jle .ominkorekteodwrr	
		sub edx, 64
		.ominkorekteodwrr:
	pop ebx
	pop ecx

	cmp dl, 32
	jb .index_poniz_32
		.index_pow_32:
			add ebx, 908	; ebx wskazuje na *rotorrev2 
			sub dl, 32	; dla liczb >32 trzeba przekonwertowac
			jmp .tablica_odwracajacego_bebna_wybrana
		.index_poniz_32:
			add ebx, 768	; ebx wskazuje na *rotorrev			
	.tablica_odwracajacego_bebna_wybrana:
	shl edx, 2		; index*4 bo inty
	add ebx, edx		; przesuniecie na tablicy rotorrevX
	mov dl, byte [ebx]	; dl = rotorrevX[indexdl] 


.beben1rev:

	;; trzeba przesunac index
	push ecx
	push ebx
		mov ebx, [esp+24]	; //poczatek struktury
		add ebx, 896		; ebx wskazuje na initpos1
		mov ecx, 0		; czyszcze sobie ecx
		mov ecx, DWORD[ebx]	; cl = initpos1
		add edx, ecx		; zmniejsz index o initpos1
		cmp edx, 0		; jesli wyszlo poza zakres
		jnl .ominkorekteodwr1	; to trzeba skorygowac
		add edx, 64
		.ominkorekteodwr1:
		cmp edx, 63		
		jle .ominkorekteodwr11	
		sub edx, 64
		.ominkorekteodwr11:
		
	pop ebx
	pop ecx

	


	shl edx, 2		; index*4 bo inty
	mov ebx, [esp+16]	; laduje adres *rotor1 (inty) ; a w zasadzie na strukture
	add ebx, 1036		; ebx wskazuje na *rotor1
	add ebx, edx		; przesuniecie na tablicy rotor1
	mov dl, byte [ebx]	; dl = rotor1rev[indexdl] 


.beben2rev:
	;; trzeba przesunac index
	push ecx
	push ebx
		mov ebx, [esp+24]	; //poczatek struktury
		add ebx, 896		; ebx wskazuje na initpos1
		mov ecx, 0		; czyszcze sobie ecx
		mov ecx, DWORD[ebx]	; cl = initpos1
		sub edx, ecx		; zmniejsz index o initpos1
		add ebx, 4		; ebx wskazuje na initpos2
		mov ecx, 0
		mov ecx, DWORD[ebx]	; ecx = initpos2
		add edx, ecx		; zwieksz index o initpos2
		cmp edx, 0		; jesli wyszlo poza zakres
		jnl .ominkorekteodwr2	; to trzeba skorygowac
		add edx, 64
		.ominkorekteodwr2:
		cmp edx, 63		
		jle .ominkorekteodwr22	
		sub edx, 64
		.ominkorekteodwr22:		
	pop ebx
	pop ecx
	
	shl edx, 2		; index*4 bo inty
	mov ebx, [esp+16]	; laduje adres *rotor2 (inty) ; a w zasadzie na strukture
	add ebx, 1292		; ebx wskazuje na *rotor2
	add ebx, edx		; przesuniecie na tablicy rotor2
	mov dl, byte [ebx]	; dl = rotor2rev[indexdl] 


.beben3rev:
	;; trzeba przesunac index
	push ecx
	push ebx
		mov ebx, [esp+24]	; //poczatek struktury
		add ebx, 900		; ebx wskazuje na initpos2
		mov ecx, 0		; czyszcze sobie ecx
		mov ecx, DWORD[ebx]	; cl = initpos2
		sub edx, ecx		; zmniejsz index o initpos2
		add ebx, 4		; ebx wskazuje na initpos3
		mov ecx, 0
		mov ecx, DWORD[ebx]	; ecx = initpos3
		add edx, ecx		; zwieksz index o initpos3
		cmp edx, 0		; jesli wyszlo poza zakres
		jnl .ominkorekteodwr3	; to trzeba skorygowac
		add edx, 64
		.ominkorekteodwr3:
		cmp edx, 63		; jesli wyszlo poza zakres
		jle .ominkorekteodwr33	; to trzeba skorygowac
		sub edx, 64
		.ominkorekteodwr33:		
	pop ebx
	pop ecx
	
	shl edx, 2		; index*4 bo inty
	mov ebx, [esp+16]	; laduje adres *rotor3 (inty) ; a w zasadzie na strukture
	add ebx, 1548		; ebx wskazuje na *rotor3
	add ebx, edx		; przesuniecie na tablicy rotor3
	mov dl, byte [ebx]	; dl = rotor3rev[indexdl] 


.wyjscie_bebna3:
	;; trzeba przesunac index
	push ecx
	push ebx
		mov ebx, [esp+24]	; //poczatek struktury
		add ebx, 904		; ebx wskazuje na initpos3
		mov ecx, 0		; czyszcze sobie ecx
		mov ecx, DWORD[ebx]	; cl = initpos3
		sub edx, ecx		; zmniejsz index o initpos3
		cmp edx, 0;		; jesli wyszlo poza zakres
		jnl .ominkorektewyjscie	; to trzeba skorygowac
		add edx, 64
		.ominkorektewyjscie:
		cmp edx, 63		
		jle .ominkorektewyjscie2	
		sub edx, 64
		.ominkorektewyjscie2:
	pop ebx
	pop ecx

; kiedy juz zaszyfrowalismy dany znak	
	add dl, 32		; konwersja indexu do ascii

; teraz trzeba obrocic bebny
	; zakres obrotu <00,63>
.obracanie_bebnow:

.obrot_beben3:
	mov ebx, [esp+16]		; na strukture
	add ebx, 904			; ebx na initpos3
	push eax
	push ecx
		mov ecx, 0
		mov ecx, DWORD[ebx]	; w ecx = initpos3
		;teraz trzeba obrocic
		cmp ecx, 63		; sprawdzam czy zwiekszenie obrotu wyjdzie poza zakres 
		jne .niezakres3	
		mov ecx, 0		; jezeli tak to wracam na poczatek, na pozycje 00 
		mov DWORD[ebx], ecx
			jmp .ominniezakres3
		.niezakres3:	
		add ecx, 1		; jesli nie to normalnie zwiekszam o 1
		mov DWORD[ebx], ecx
			.ominniezakres3:
		; beben3 obrocony, trzeba sprawdzic czy obracac nastepne
		add ebx, 908		; ebx wskazuje na rots3
		mov eax, 0
		mov eax, DWORD[ebx]	; eax = rots3
		cmp ecx, eax		; porownuje initpos3 i rots3 czyli poczatkowa 
		je .obrot_beben2	; i obecna pozycje, jesli rowne to wykonano pelny obrot
		.koniec_obrotbeben2:
	pop ecx
	pop eax


	; jesli obrocilismy bebny	
	jmp .koniec_pracy_enigmy

.obrot_beben2:
	mov ebx, [esp+24]		; na strukture
	add ebx, 1808			; ebx wskazuje na rots2 (1808)
	mov eax, 0
	mov eax, DWORD[ebx]		; eax = rots2
	sub ebx, 908			; ebx wskazuje na initpos2 (900)
	mov ecx, 0
	mov ecx, DWORD[ebx]		; ecx = initpos2
	; teraz trzeba obrocic
	cmp ecx, 63
		jne .ominzakres2
	mov ecx, 0			; jezeli tak to wracam na poczatek, na pozycje 00
	mov DWORD[ebx], ecx
		jmp .ominniezakres2
		.ominzakres2:	
	add ecx, 1			; jesli nie to normalnie zwiekszam o 1
	mov DWORD[ebx], ecx
		.ominniezakres2:
	; beben odwrocony, trzeba sprawdzic czy obracamy nastepny
	cmp ecx, eax			; porownuje initpos2 i rots2 czyli poczatkowa 
	je .obrot_beben1		; i obecna pozycje, jesli rowne to wykonano pelny obrot
	.koniec_obrotbeben1:

	jmp .koniec_obrotbeben2

.obrot_beben1:
	mov ebx, [esp+24]		; na strukture
	add ebx, 1804			; ebx wskazuje na rots1 (1804)
	mov eax, 0
	mov eax, DWORD[ebx]		; eax = rots1
	sub ebx, 908			; ebx wskazuje na initpos1 (896)
	mov ecx, 0
	mov ecx, DWORD[ebx]		; ecx = initpos1
	; teraz trzeba obrocic
	cmp ecx, 63
	jne .niezakres1
	mov ecx, 0			; jesli przekroczylo zakres to wracam na pozycje 00
	mov DWORD[ebx], ecx
		jmp .ominniezakres1
	.niezakres1:
	add ecx, 1
	mov DWORD[ebx], ecx
		.ominniezakres1:
	;beben odwrocony

	jmp .koniec_obrotbeben1


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

