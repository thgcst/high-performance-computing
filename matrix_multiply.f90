! ------------------------------------------------------
! Compute the area of a triangle using Heron's formula
! ------------------------------------------------------

! PROGRAM  HeronFormula
!    IMPLICIT  NONE

!    REAL     :: a, b, c             ! three sides
!    REAL     :: s                   ! half of perimeter
!    REAL     :: Area                ! triangle area
!    LOGICAL  :: Cond_1, Cond_2      ! two logical conditions

!    READ(*,*)  a, b, c

!    WRITE(*,*)  "a = ", a
!    WRITE(*,*)  "b = ", b
!    WRITE(*,*)  "c = ", c
!    WRITE(*,*)

!    Cond_1 = (a > 0.) .AND. (b > 0.) .AND. (c > 0.0)
!    Cond_2 = (a + b > c) .AND. (a + c > b) .AND. (b + c > a)
!    IF (Cond_1 .AND. Cond_2) THEN
!       s    = (a + b + c) / 2.0
!       Area = SQRT(s * (s - a) * (s - b) * (s - c))
!       WRITE(*,*) "Triangle area = ", Area
!    ELSE
!       WRITE(*,*) "ERROR: this is not a triangle!"
!    END IF

! END PROGRAM  HeronFormula

PROGRAM Main
  IMPLICIT NONE

  real                      :: u
  integer                   :: random, i, j
  integer, parameter        :: N = 3
  integer, dimension (N,N)  :: A
  integer, dimension (N,1)  :: x, b, c

  call random_number(u)
  random = FLOOR(10*u)

  print*, ""
  print*, "Matriz A:"
  do i = 1, N
    do j = 1, N
      call random_number(u)
      random = FLOOR(10*u)
      A(i,j) = random
    end do
    print*, A(i,:)
  end do

  print*, ""
  print*, "Matriz x:"
  do i = 1, N
    call random_number(u)
    random = FLOOR(10*u)
    x(i,1) = random
    print*, x(i,1)
  end do

  b = 0
  print*, ""
  print*, "Matriz b:"
  do i = 1, N
    do j = 1, N
      b(i,1) = b(i,1) + A(i,j) * x(j,1)
    end do
    print*, b(i,:)
  end do

  c = 0
  print*, ""
  print*, "Matriz c:"
  do j = 1, N
    do i = 1, N
      c(i,1) = c(i,1) + A(i,j) * x(j,1)
    end do
  end do
  do i = 1, N
    print*, c(i,1)
  end do

END PROGRAM Main