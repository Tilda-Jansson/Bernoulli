            *> cobc -x -o bernoulli bernoulli.cbl
            *> ./bernoulli
            
            IDENTIFICATION DIVISION.
            PROGRAM-ID. BERNOULLI.

            DATA DIVISION.
              WORKING-STORAGE SECTION.
              01 N PIC 9(9) VALUE 10.
              01 K PIC 9(9) VALUE 0.
              01 WS PIC 9(2) VALUE 0.

              *> variables we will use to store results
              *> of operations
              01 R PIC 9(9) VALUE 1.
              01 I PIC 9(9) VALUE 0.
              01 M PIC 9(9) VALUE 0.

              01 N1 PIC 9(9).
              01 NB PIC 9(9).
              01 KB PIC 9(9).
              01 K1 PIC 9(9).

              01 RES-SUB1 PIC S9(3)V9(15).
              01 RES-DIV1 PIC S9(3)V9(15).
              01 RES-DIV PIC S9(3)V9(15).

              01 B.
                  02 ELEM PIC S9(3)V9(15) OCCURS 20 TIMES.
              
 
            PROCEDURE DIVISION.
            
              MOVE 1 TO ELEM(1) *> B[1] <-- 1  
              ADD 2 TO N GIVING N1
              PERFORM LOOP1 VARYING M FROM 2 BY 1 UNTIL M=N1. *> for m <-- 2 to n+1 do    
              *>DISPLAY ELEM(4) *> return B
              PERFORM PRINTB VARYING WS FROM 1 BY 1 UNTIL WS=12.
              STOP RUN.

            *> defined paragraphs/functions that will
            *> be called in our loop above
            PRINTB.
            DISPLAY ELEM(WS).

            LOOP1.
            MOVE 0 TO ELEM(M) *> B[m] <-- 0   
            PERFORM LOOP2 VARYING K FROM 1 BY 1 UNTIL K=M *> for k <-- 1 to m - 1 do   
            DIVIDE ELEM(M) BY M GIVING RES-DIV1 *> B[m] <-- B[m]/m
            MOVE RES-DIV1 TO ELEM(M).

            LOOP2.
            ADD M TO 0 GIVING NB *> represents n in BINOM
            SUBTRACT 1 FROM K GIVING KB *> represents k in BINOM
            PERFORM BINOM
            COMPUTE RES-SUB1 = (ELEM(M) - (R * ELEM(K))) *> B[m] <-- B[m] − BINOM (m, k-1) * B[k]
            MOVE RES-SUB1 TO ELEM(M).

  
            BINOM.
            ADD 1 TO KB GIVING K1
            ADD 1 TO 0 GIVING R  *> r <-- 1 
            PERFORM BINOMFORLOOP VARYING I FROM 1 BY 1 UNTIL I=K1. *>for i <-- 1 to k do  

            BINOMFORLOOP.
            COMPUTE RES-DIV = ((((NB - I) + 1) * R)/I)   *> r <-- r · (n − i + 1)/i    
            INITIALIZE R REPLACING NUMERIC DATA BY RES-DIV.  *>return r 
