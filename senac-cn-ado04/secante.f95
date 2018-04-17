PROGRAM SECANTE
    IMPLICIT NONE
    CHARACTER(LEN=12):: INPUT
    REAL:: VALUE
    CALL GETARG(1, INPUT)
    READ(INPUT, *) VALUE
    PRINT *, GET_SQRT(VALUE, 1E-6)
    CONTAINS
    FUNCTION GET_SQRT(VALUE, TOLERANCE) RESULT(P)
        REAL, INTENT(IN):: VALUE, TOLERANCE
        REAL:: P, INITIAL, FINAL
        INTEGER, PARAMETER:: MAX_ITERATION = 1E+6
        INTEGER:: I = 0
        INITIAL = 0
        FINAL = VALUE
100     IF (I .LT. MAX_ITERATION) THEN
            P = FINAL - (((FINAL ** 2 - VALUE) * (FINAL - INITIAL))/((FINAL ** 2 - VALUE) - (INITIAL ** 2 - VALUE)))
            IF (MOD(P - FINAL).LT.TOLERANCE) RETURN
            INITIAL = FINAL
            FINAL = P
            I = I + 1
            GOTO 100
        ELSE
            P = -1
        END IF
    END FUNCTION GET_SQRT

    FUNCTION MOD(VALUE) RESULT(J)
        REAL, INTENT(IN):: VALUE
        REAL:: J
        IF (VALUE < 0) THEN
            J = -VALUE
        ELSE 
            J = VALUE
        END IF
    END FUNCTION MOD
END PROGRAM SECANTE