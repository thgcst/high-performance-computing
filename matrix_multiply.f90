! ------------------------------------------------------
! Multiply random N:N matrix by random N:1 matrix
! ------------------------------------------------------

PROGRAM Main
  IMPLICIT NONE

  real                      :: u, startB, finishB, startC, finishC
  integer                   :: random, i, j
  integer, parameter        :: N = 10
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
  call cpu_time(startB)
  do i = 1, N
    do j = 1, N
      b(i,1) = b(i,1) + A(i,j) * x(j,1)
    end do
    print*, b(i,:)
  end do
  call cpu_time(finishB)

  c = 0
  print*, ""
  print*, "Matriz c:"
  call cpu_time(startC)
  do j = 1, N
    do i = 1, N
      c(i,1) = c(i,1) + A(i,j) * x(j,1)
    end do
  end do
  call cpu_time(finishC)
  do i = 1, N
    print*, c(i,1)
  end do


  print '("Generating matrix b took",f6.3," seconds to execute")',finishB-startB
  print '("Generating matrix c took",f6.3," seconds to execute")',finishC-startC

END PROGRAM Main