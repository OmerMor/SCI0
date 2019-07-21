
				Listing of avoider.sc:	[script -1]


LINE/	OFFSET	CODE				NAME
LABEL	(HEX)




Hunk: code  (1010 bytes)
		    0	word	$2
		    2	word	$3f2




Method: init

		    4	pushi	$3a  	(heading)
		    6	push0
		    7	pToa 	$8   	(client)
		    9	send
		    a	byte	$4
		    b	aTop 	$a   	(heading)
		    d	ldi  	$0   
		    f	aTop 	$18  	(counter)
		   11	ldi  	$a   
		   13	aTop 	$1a  	(nonBumps)
		   15	ldi  	$0   
		   17	aTop 	$12  	(escaping)
		   19	ret



Method: incClientPos

		   1a	pushi	$4   	(x)
		   1c	push1
		   1d	pushi	$4   	(x)
		   1f	push0
		   20	pToa 	$8   	(client)
		   22	send
		   23	byte	$4
		   24	push
		   25	push1
		   26	push2
		   27	pTos 	$a   	(heading)
		   29	pushi	$64  
		   2b	callk	$6c  	(SinMult)
		   2d	byte	$4
		   2e	push
		   2f	calle	$3e7/$0	(sign)
		   34	byte	$2
		   35	push
		   36	pushi	$36  	(xStep)
		   38	push0
		   39	pToa 	$8   	(client)
		   3b	send
		   3c	byte	$4
		   3d	mul
		   3e	add
		   3f	push
		   40	pushi	$3   	(y)
		   42	push1
		   43	pushi	$3   	(y)
		   45	push0
		   46	pToa 	$8   	(client)
		   48	send
		   49	byte	$4
		   4a	push
		   4b	push1
		   4c	push2
		   4d	pTos 	$a   	(heading)
		   4f	pushi	$64  
		   51	callk	$6d  	(CosMult)
		   53	byte	$4
		   54	push
		   55	calle	$3e7/$0	(sign)
		   5a	byte	$2
		   5b	push
		   5c	pushi	$37  	(yStep)
		   5e	push0
		   5f	pToa 	$8   	(client)
		   61	send
		   62	byte	$4
		   63	mul
		   64	sub
		   65	push
		   66	pushi	$3a  	(heading)
		   68	push1
		   69	pTos 	$a   	(heading)
		   6b	pToa 	$8   	(client)
		   6d	send
		   6e	byte	$12
		   6f	ret



Method: pickLoop

		   70	pushi	$3a  	(heading)
		   72	push1
		   73	lsp  	$1   	(angle)
		   75	pToa 	$8   	(client)
		   77	send
		   78	byte	$6
		   79	pushi	$3e  	(looper)
		   7b	push0
		   7c	pToa 	$8   	(client)
		   7e	send
		   7f	byte	$4
		   80	bnt  	$13  	(.1)
		   83	pushi	$3c  	(doit)
		   85	push2
		   86	pTos 	$8   	(client)
		   88	lsp  	$1   	(angle)
		   8a	pushi	$3e  	(looper)
		   8c	push0
		   8d	pToa 	$8   	(client)
		   8f	send
		   90	byte	$4
		   91	send
		   92	byte	$8
		   93	jmp  	$8   	(.2)
.1
		   96	push2
		   97	pTos 	$8   	(client)
		   99	lsp  	$1   	(angle)
		   9b	callk	$50  	(DirLoop)
		   9d	byte	$4
.2
		   9e	ret



Method: canBeHere

		   9f	pushi	$39  	(canBeHere)
		   a1	push0
		   a2	pToa 	$8   	(client)
		   a4	send
		   a5	byte	$4
		   a6	bnt  	$25  	(.5)
		   a9	push0
		   aa	pushi	$4   	(x)
		   ac	push0
		   ad	pToa 	$8   	(client)
		   af	send
		   b0	byte	$4
		   b1	le?
		   b2	bnt  	$19  	(.5)
		   b5	pprev
		   b6	ldi  	$140 
		   b9	le?
.3
		   ba	bnt  	$11  	(.5)
		   bd	push0
		   be	pushi	$3   	(y)
		   c0	push0
		   c1	pToa 	$8   	(client)
		   c3	send
		   c4	byte	$4
		   c5	le?
		   c6	bnt  	$5   	(.4)
		   c9	pprev
		   ca	ldi  	$c8  
		   cd	le?
.4
.5
		   ce	ret



Method: doit

		   cf	link 	$d   
		   d1	pushi	$3b  	(mover)
		   d3	push0
		   d4	pToa 	$8   	(client)
		   d6	send
		   d7	byte	$4
		   d8	sat  	$6   	(motion)
		   da	not
		   db	bnt  	$9   	(.6)
		   de	ldi  	$fc18
		   e1	aTop 	$a   	(heading)
		   e3	ret
		   e4	jmp  	$24  	(.9)
.6
		   e7	pushi	$a7  	(onTarget)
		   ea	push0
		   eb	lat  	$6   	(motion)
		   ed	send
		   ee	byte	$4
		   ef	bnt  	$b   	(.7)
		   f2	pushi	$3c  	(doit)
		   f4	push0
		   f5	lat  	$6   	(motion)
		   f7	send
		   f8	byte	$4
		   f9	ret
		   fa	jmp  	$e   	(.9)
.7
		   fd	pTos 	$a   	(heading)
		   ff	ldi  	$fc18
		  102	eq?
.8
		  103	bnt  	$5   	(.9)
		  106	pushi	$55  	(init)
		  108	push0
		  109	self
		  10a	byte	$4
.9
		  10b	pTos 	$1a  	(nonBumps)
		  10d	ldi  	$3   
		  10f	le?
.10
		  110	sat  	$c   	(bumping)
		  112	pushi	$a6  	(setTarget)
		  115	push0
		  116	lat  	$6   	(motion)
		  118	send
		  119	byte	$4
		  11a	pushi	$4   	(x)
		  11c	push0
		  11d	lat  	$6   	(motion)
		  11f	send
		  120	byte	$4
		  121	sat  	$4   	(mx)
		  123	pushi	$3   	(y)
		  125	push0
		  126	lat  	$6   	(motion)
		  128	send
		  129	byte	$4
		  12a	sat  	$5   	(my)
		  12c	pushi	$4   	(x)
		  12e	push0
		  12f	pToa 	$8   	(client)
		  131	send
		  132	byte	$4
		  133	sat  	$2   	(cx)
		  135	pushi	$3   	(y)
		  137	push0
		  138	pToa 	$8   	(client)
		  13a	send
		  13b	byte	$4
		  13c	sat  	$3   	(cy)
		  13e	pushi	$4   
		  140	lst  	$2   	(cx)
		  142	push
		  143	lst  	$4   	(mx)
		  145	lst  	$5   	(my)
		  147	callk	$43  	(GetAngle)
		  149	byte	$8
		  14a	sat  	$7   	(ang)
		  14c	pushi	$4   
		  14e	lst  	$2   	(cx)
		  150	lst  	$3   	(cy)
		  152	lst  	$4   	(mx)
		  154	lst  	$5   	(my)
		  156	callk	$44  	(GetDistance)
		  158	byte	$8
		  159	sat  	$1   	(d)
		  15b	push2
		  15c	pushi	$2d  
		  15e	pTos 	$a   	(heading)
		  160	ldi  	$2d  
		  162	div
		  163	mul
		  164	push
		  165	pushi	$168 
		  168	calle	$3e7/$1	(umod)
		  16d	byte	$4
		  16e	aTop 	$a   	(heading)
		  170	sat  	$0   	(h)
		  172	pToa 	$12  	(escaping)
		  174	bt   	$7   	(.12)
		  177	pTos 	$1a  	(nonBumps)
		  179	ldi  	$2   
		  17b	le?
.11
		  17c	sat  	$c   	(bumping)
.12
		  17e	not
		  17f	bnt  	$4f  	(.20)
		  182	pTos 	$1a  	(nonBumps)
		  184	ldi  	$4   
		  186	eq?
.13
		  187	bnt  	$6   	(.14)
		  18a	push1
		  18b	lst  	$6   	(motion)
		  18d	callk	$53  	(InitBresen)
		  18f	byte	$2
.14
		  190	pushi	$3c  	(doit)
		  192	push0
		  193	lat  	$6   	(motion)
		  195	send
		  196	byte	$4
		  197	lst  	$2   	(cx)
		  199	pushi	$4   	(x)
		  19b	push0
		  19c	pToa 	$8   	(client)
		  19e	send
		  19f	byte	$4
		  1a0	ne?
.15
		  1a1	bt   	$a   	(.17)
		  1a4	lst  	$3   	(cy)
		  1a6	pushi	$3   	(y)
		  1a8	push0
		  1a9	pToa 	$8   	(client)
		  1ab	send
		  1ac	byte	$4
		  1ad	ne?
.16
.17
		  1ae	bnt  	$e   	(.18)
		  1b1	pushi	$ab  	(pickLoop)
		  1b4	push1
		  1b5	lst  	$7   	(ang)
		  1b7	self
		  1b8	byte	$6
		  1b9	ipToa	$1a  	(nonBumps)
		  1bb	ret
		  1bc	jmp  	$12  	(.19)
.18
		  1bf	ldi  	$0   
		  1c1	aTop 	$1a  	(nonBumps)
		  1c3	pushi	$4   	(x)
		  1c5	push1
		  1c6	lst  	$2   	(cx)
		  1c8	pushi	$3   	(y)
		  1ca	push1
		  1cb	lst  	$3   	(cy)
		  1cd	pToa 	$8   	(client)
		  1cf	send
		  1d0	byte	$c
.19
.20
		  1d1	pTos 	$1c  	(targetX)
		  1d3	lat  	$4   	(mx)
		  1d5	aTop 	$1c  	(targetX)
		  1d7	ne?
.21
		  1d8	bt   	$25  	(.29)
		  1db	pTos 	$1e  	(targetY)
		  1dd	lat  	$5   	(my)
		  1df	aTop 	$1e  	(targetY)
		  1e1	ne?
.22
		  1e2	bt   	$1b  	(.29)
		  1e5	pToa 	$12  	(escaping)
		  1e7	bnt  	$29  	(.30)
		  1ea	dpToa	$18  	(counter)
		  1ec	push
		  1ed	ldi  	$0   
		  1ef	le?
.23
		  1f0	bt   	$d   	(.27)
		  1f3	lst  	$1   	(d)
		  1f5	pToa 	$16  	(nearestDist)
		  1f7	lt?
.24
		  1f8	bnt  	$18  	(.30)
		  1fb	pTos 	$18  	(counter)
		  1fd	ldi  	$28  
		  1ff	lt?
.25
.26
.27
.28
.29
		  200	bnt  	$10  	(.30)
		  203	ldi  	$0   
		  205	aTop 	$12  	(escaping)
		  207	ldi  	$7d00
		  20a	aTop 	$16  	(nearestDist)
		  20c	ldi  	$0   
		  20e	aTop 	$18  	(counter)
		  210	jmp  	$37  	(.35)
.30
		  213	pToa 	$12  	(escaping)
		  215	bnt  	$5   	(.31)
		  218	ldi  	$1   
		  21a	jmp  	$2d  	(.35)
.31
		  21d	lst  	$1   	(d)
		  21f	pToa 	$16  	(nearestDist)
		  221	lt?
.32
		  222	bnt  	$b   	(.33)
		  225	lat  	$1   	(d)
		  227	aTop 	$16  	(nearestDist)
		  229	ldi  	$0   
		  22b	aTop 	$18  	(counter)
		  22d	jmp  	$1a  	(.35)
.33
		  230	ipToa	$18  	(counter)
		  232	push
		  233	ldi  	$32  
		  235	ge?
.34
		  236	aTop 	$12  	(escaping)
		  238	bnt  	$f   	(.35)
		  23b	push2
		  23c	pushi	$28  
		  23e	pushi	$50  
		  240	callk	$40  	(Random)
		  242	byte	$4
		  243	aTop 	$18  	(counter)
		  245	pToa 	$14  	(escapeTurn)
		  247	neg
		  248	aTop 	$14  	(escapeTurn)
.35
		  24a	lst  	$7   	(ang)
		  24c	lat  	$0   	(h)
		  24e	sub
		  24f	sat  	$7   	(ang)
		  251	push
		  252	ldi  	$ff4c
		  255	le?
.36
		  256	bnt  	$b   	(.37)
		  259	lst  	$7   	(ang)
		  25b	ldi  	$168 
		  25e	add
		  25f	sat  	$7   	(ang)
		  261	jmp  	$11  	(.39)
.37
		  264	lst  	$7   	(ang)
		  266	ldi  	$b4  
		  269	gt?
.38
		  26a	bnt  	$8   	(.39)
		  26d	lst  	$7   	(ang)
		  26f	ldi  	$168 
		  272	sub
		  273	sat  	$7   	(ang)
.39
		  275	push1
		  276	lst  	$7   	(ang)
		  278	callk	$41  	(Abs)
		  27a	byte	$2
		  27b	sat  	$8   	(absDiff)
		  27d	push
		  27e	ldi  	$5a  
		  280	le?
.40
		  281	sat  	$b   	(facing)
		  283	pToa 	$12  	(escaping)
		  285	bnt  	$c   	(.41)
		  288	push1
		  289	lst  	$7   	(ang)
		  28b	calle	$3e7/$0	(sign)
		  290	byte	$2
		  291	jmp  	$2a  	(.45)
.41
		  294	lat  	$b   	(facing)
		  296	bnt  	$c   	(.42)
		  299	push1
		  29a	lst  	$7   	(ang)
		  29c	calle	$3e7/$0	(sign)
		  2a1	byte	$2
		  2a2	jmp  	$19  	(.45)
.42
		  2a5	pToa 	$c   	(bumpTurn)
		  2a7	bnt  	$3   	(.43)
		  2aa	jmp  	$11  	(.45)
.43
		  2ad	pToa 	$e   	(lastBumped)
		  2af	bnt  	$3   	(.44)
		  2b2	jmp  	$9   	(.45)
.44
		  2b5	push1
		  2b6	lst  	$7   	(ang)
		  2b8	calle	$3e7/$0	(sign)
		  2bd	byte	$2
.45
		  2be	bt   	$2   	(.46)
		  2c1	pToa 	$14  	(escapeTurn)
.46
		  2c3	aTop 	$10  	(thisTurn)
		  2c5	lst  	$8   	(absDiff)
		  2c7	ldi  	$16  
		  2c9	gt?
.47
		  2ca	bnt  	$15  	(.50)
		  2cd	ldi  	$0   
		  2cf	bt   	$3   	(.48)
		  2d2	pToa 	$12  	(escaping)
		  2d4	not
.48
.49
		  2d5	bnt  	$a   	(.50)
		  2d8	pTos 	$a   	(heading)
		  2da	pTos 	$10  	(thisTurn)
		  2dc	ldi  	$2d  
		  2de	mul
		  2df	add
		  2e0	aTop 	$a   	(heading)
.50
		  2e2	pToa 	$12  	(escaping)
		  2e4	bnt  	$4   	(.51)
		  2e7	pToa 	$14  	(escapeTurn)
		  2e9	aTop 	$10  	(thisTurn)
.51
		  2eb	pushi	$aa  	(incClientPos)
		  2ee	push0
		  2ef	self
		  2f0	byte	$4
		  2f1	pushi	$39  	(canBeHere)
		  2f3	push0
		  2f4	self
		  2f5	byte	$4
		  2f6	bnt  	$10  	(.53)
		  2f9	ipToa	$1a  	(nonBumps)
		  2fb	ldi  	$0   
		  2fd	aTop 	$c   	(bumpTurn)
		  2ff	pToa 	$12  	(escaping)
		  301	not
		  302	bnt  	$10  	(.54)
		  305	ret
.52
		  306	jmp  	$c   	(.54)
.53
		  309	pToa 	$c   	(bumpTurn)
		  30b	aTop 	$e   	(lastBumped)
		  30d	pToa 	$10  	(thisTurn)
		  30f	aTop 	$c   	(bumpTurn)
		  311	ldi  	$0   
		  313	aTop 	$1a  	(nonBumps)
.54
		  315	pToa 	$12  	(escaping)
		  317	bnt  	$66  	(.62)
		  31a	pushi	$2d  
		  31c	pTos 	$a   	(heading)
		  31e	ldi  	$2d  
		  320	div
		  321	mul
		  322	sat  	$0   	(h)
		  324	ldi  	$0   
		  326	sat  	$a   	(j)
.55
		  328	lst  	$a   	(j)
		  32a	ldi  	$8   
		  32c	lt?
.56
		  32d	bnt  	$3a  	(.59)
		  330	pushi	$39  	(canBeHere)
		  332	push0
		  333	self
		  334	byte	$4
.57
		  335	bnt  	$32  	(.59)
		  338	push2
		  339	lst  	$0   	(h)
		  33b	pushi	$2d  
		  33d	lat  	$a   	(j)
		  33f	mul
		  340	push
		  341	pToa 	$14  	(escapeTurn)
		  343	mul
		  344	add
		  345	push
		  346	pushi	$168 
		  349	calle	$3e7/$1	(umod)
		  34e	byte	$4
		  34f	aTop 	$a   	(heading)
		  351	pushi	$4   	(x)
		  353	push1
		  354	lst  	$2   	(cx)
		  356	pushi	$3   	(y)
		  358	push1
		  359	lst  	$3   	(cy)
		  35b	pToa 	$8   	(client)
		  35d	send
		  35e	byte	$c
		  35f	pushi	$aa  	(incClientPos)
		  362	push0
		  363	self
		  364	byte	$4
.58
		  365	+at  	$a   	(j)
		  367	jmp  	$ffbe	(.55)
.59
		  36a	lst  	$a   	(j)
		  36c	ldi  	$8   
		  36e	eq?
.60
		  36f	bnt  	$a   	(.61)
		  372	pTos 	$a   	(heading)
		  374	pTos 	$14  	(escapeTurn)
		  376	ldi  	$2d  
		  378	mul
		  379	add
		  37a	aTop 	$a   	(heading)
.61
		  37c	pToa 	$a   	(heading)
		  37e	sat  	$0   	(h)
.62
		  380	ldi  	$1   
		  382	sat  	$9   	(i)
		  384	sat  	$a   	(j)
.63
		  386	pushi	$39  	(canBeHere)
		  388	push0
		  389	self
		  38a	byte	$4
		  38b	not
		  38c	bnt  	$49  	(.71)
		  38f	lst  	$9   	(i)
		  391	ldi  	$8   
		  393	lt?
.64
.65
		  394	bnt  	$41  	(.71)
		  397	pushi	$4   	(x)
		  399	push1
		  39a	lst  	$2   	(cx)
		  39c	pushi	$3   	(y)
		  39e	push1
		  39f	lst  	$3   	(cy)
		  3a1	pToa 	$8   	(client)
		  3a3	send
		  3a4	byte	$c
		  3a5	lst  	$0   	(h)
		  3a7	pushi	$2d  
		  3a9	lat  	$a   	(j)
		  3ab	mul
		  3ac	push
		  3ad	pToa 	$10  	(thisTurn)
		  3af	mul
		  3b0	sub
		  3b1	aTop 	$a   	(heading)
		  3b3	pushi	$aa  	(incClientPos)
		  3b6	push0
		  3b7	self
		  3b8	byte	$4
.66
		  3b9	pToa 	$12  	(escaping)
		  3bb	bnt  	$5   	(.67)
		  3be	+at  	$9   	(i)
		  3c0	jmp  	$10  	(.70)
.67
		  3c3	lst  	$a   	(j)
		  3c5	ldi  	$0   
		  3c7	gt?
.68
		  3c8	bnt  	$6   	(.69)
		  3cb	lat  	$a   	(j)
		  3cd	neg
		  3ce	jmp  	$2   	(.70)
.69
		  3d1	+at  	$9   	(i)
.70
		  3d3	sat  	$a   	(j)
		  3d5	jmp  	$ffae	(.63)
.71
		  3d8	pushi	$39  	(canBeHere)
		  3da	push0
		  3db	self
		  3dc	byte	$4
		  3dd	not
		  3de	bnt  	$8   	(.72)
		  3e1	pushi	$b6  	(findPosn)
		  3e4	push0
		  3e5	pToa 	$8   	(client)
		  3e7	send
		  3e8	byte	$4
.72
		  3e9	pushi	$ab  	(pickLoop)
		  3ec	push1
		  3ed	pTos 	$a   	(heading)
		  3ef	self
		  3f0	byte	$6
		  3f1	ret



Hunk: class  (100 bytes)
		  3f2	word	$6
		  3f4	word	$64


Object: Avoider             

		  3f6	word	$1234
		  3f8	word	$0
		  3fa	word	$42
		  3fc	word	$10
.73
		(properties)
		  3fe	prop  $23  	(species)
		  400	prop  $0   	(superClass)
		  402	prop  $8000	(-info-)
		  404	text  $45a 	(name)
		  406	prop  $0   	(client)
		  408	prop  $fc18	(heading)
		  40a	prop  $0   	(bumpTurn)
		  40c	prop  $0   	(lastBumped)
		  40e	prop  $1   	(thisTurn)
		  410	prop  $0   	(escaping)
		  412	prop  $1   	(escapeTurn)
		  414	prop  $7d00	(nearestDist)
		  416	prop  $0   	(counter)
		  418	prop  $a   	(nonBumps)
		  41a	prop  $0   	(targetX)
		  41c	prop  $0   	(targetY)
		(property dictionary)
		  41e	word	$0
		  420	word	$1
		  422	word	$2
		  424	word	$17
		  426	word	$2d
		  428	word	$3a
		  42a	word	$ac
		  42c	word	$ad
		  42e	word	$ae
		  430	word	$af
		  432	word	$b0
		  434	word	$b1
		  436	word	$b2
		  438	word	$b3
		  43a	word	$b4
		  43c	word	$b5
		(method dictionary)
		  43e	word	$5
		  440	word	$55
		  442	word	$3c
		  444	word	$aa
		  446	word	$ab
		  448	word	$39
		(methods)
		  44a	word	$0
		  44c	local $4   	(init)
		  44e	local $cf  	(doit)
		  450	local $1a  	(incClientPos)
		  452	local $70  	(pickLoop)
		  454	local $9f  	(canBeHere)



Hunk: text  (10 bytes)
		  456	word	$5
		  458	word	$a

		  45a	text
"Avoid"




Hunk: variables  (202 bytes)
		  460	word	$a
		  462	word	$ca

		  464	word	$0
		  466	word	$0
		  468	word	$0
		  46a	word	$6
		  46c	word	$0
		  46e	word	$0
		  470	word	$0
		  472	word	$0
		  474	word	$0
		  476	word	$0
		  478	word	$0
		  47a	word	$0
		  47c	word	$0
		  47e	word	$0
		  480	word	$0
		  482	word	$0
		  484	word	$0
		  486	word	$7
		  488	word	$0
		  48a	word	$0
		  48c	word	$3e7
		  48e	word	$3e5
		  490	word	$1
		  492	word	$4
		  494	word	$0
		  496	word	$0
		  498	word	$1
		  49a	word	$c
		  49c	word	$45a
		  49e	word	$0
		  4a0	word	$0
		  4a2	word	$0
		  4a4	word	$0
		  4a6	word	$0
		  4a8	word	$0
		  4aa	word	$0
		  4ac	word	$0
		  4ae	word	$0
		  4b0	word	$0
		  4b2	word	$0
		  4b4	word	$0
		  4b6	word	$0
		  4b8	word	$0
		  4ba	word	$0
		  4bc	word	$0
		  4be	word	$0
		  4c0	word	$0
		  4c2	word	$0
		  4c4	word	$0
		  4c6	word	$0
		  4c8	word	$a
		  4ca	word	$0
		  4cc	word	$0
		  4ce	word	$0
		  4d0	word	$0
		  4d2	word	$0
		  4d4	word	$1
		  4d6	word	$0
		  4d8	word	$0
		  4da	word	$0
		  4dc	word	$0
		  4de	word	$0
		  4e0	word	$0
		  4e2	word	$0
		  4e4	word	$0
		  4e6	word	$0
		  4e8	word	$0
		  4ea	word	$0
		  4ec	word	$0
		  4ee	word	$0
		  4f0	word	$0
		  4f2	word	$0
		  4f4	word	$0
		  4f6	word	$0
		  4f8	word	$0
		  4fa	word	$0
		  4fc	word	$0
		  4fe	word	$0
		  500	word	$0
		  502	word	$0
		  504	word	$0
		  506	word	$0
		  508	word	$0
		  50a	word	$0
		  50c	word	$0
		  50e	word	$0
		  510	word	$0
		  512	word	$0
		  514	word	$0
		  516	word	$0
		  518	word	$0
		  51a	word	$0
		  51c	word	$0
		  51e	word	$0
		  520	word	$0
		  522	word	$0
		  524	word	$0
		  526	word	$0
		  528	word	$0



Hunk: fixups  (10 bytes)
		  52a	word	$8
		  52c	word	$a

		  530	word	$2
		  532	word	$404
		  534	word	$49c



Hunk: end  (0 bytes)
		  534	word	$0





PUBLICS:
	no entries


OPTIMIZATIONS:

	optimize passes: 3
	resolve offset passes: 5

	double returns removed: 0
	load/push -> load to stack: 57
	loadi/push -> pushi: 55
	jumps to jumps removed: 7
	loadi of current acc: 0
	load of current acc: 4
	push of current stack: 0
	pushi of current stack: 0
	load to stack of current stack: 1
	pushi 0 -> push0: 32
	pushi 1 -> push1: 19
	pushi 2 -> push2: 7
	selfID/push -> pushSelf: 0
	selfID/send -> sendSelf: 10
