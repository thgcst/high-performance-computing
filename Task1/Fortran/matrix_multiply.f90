! ------------------------------------------------------
! Multiply random N:N matrix by random N:1 matrix
! ------------------------------------------------------

PROGRAM Main
  IMPLICIT NONE

  real                      :: u, startB, finishB, startC, finishC
  integer                   :: i, j
  integer, parameter        :: N = 30000
  real, dimension (N,N)     :: A
  real, dimension (N,1)     :: x, b, c
  logical                   :: printMatrixs = .false. ! Change the value in order to print the matrices

  ! ------------------------------------------------------ Matrix A
  do i = 1, N
    do j = 1, N
      call random_number(u)
      A(i,j) = u
    end do
  end do

  if(printMatrixs) then
    print*, ""
    print*, "Matriz A:"
    do i = 1, N
      print*, A(i,:)
    end do
  end if


  ! ------------------------------------------------------ Matrix x
  do i = 1, N
    call random_number(u)
    x(i,1) = u
  end do
  
  if(printMatrixs) then
    print*, ""
    print*, "Matriz x:"
    do i = 1, N
      print*, x(i,1)
    end do
  end if


  ! ------------------------------------------------------ Matrix b
  b = 0.0
  call cpu_time(startB)
  do i = 1, N
    do j = 1, N
      b(i,1) = b(i,1) + A(i,j) * x(j,1)
    end do
  end do
  call cpu_time(finishB)

  if(printMatrixs) then
    print*, ""
    print*, "Matriz b:"
    do i = 1, N
      print*, b(i,1)
    end do
  end if


  ! ------------------------------------------------------ Matrix c
  c = 0.0
  call cpu_time(startC)
  do j = 1, N
    do i = 1, N
      c(i,1) = c(i,1) + A(i,j) * x(j,1)
    end do
  end do
  call cpu_time(finishC)


  if(printMatrixs) then
    print*, ""
    print*, "Matriz c:"
    do i = 1, N
      print*, c(i,1)
    end do
  end if


  ! ------------------------------------------------------ Results time
  print '(I0, ";", f10.6, ";", f10.6)', N, finishB - startB, finishC - startC

END PROGRAM Main