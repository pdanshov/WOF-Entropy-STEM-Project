#!/usr/bin/perl



=comment
gcd.f90:
PROGRAM  GreatestCommonDivisor
   IMPLICIT  NONE

   INTEGER   :: a, b, c

   WRITE(*,*) 'Two positive integers please --> '
   READ(*,*)  a, b
   IF (a < b) THEN       ! since a >= b must be true, they
      c = a              ! are swapped if a < b
      a = b
      b = c
   END IF

   DO                    ! now we have a <= b
      c = MOD(a, b)      !    compute c, the reminder
      IF (c == 0) EXIT   !    if c is zero, we are done.  GCD = b
      a = b              !    otherwise, b becomes a
      b = c              !    and c becomes b
   END DO                !    go back

   WRITE(*,*) 'The GCD is ', b

END PROGRAM  GreatestCommonDivisor
=end