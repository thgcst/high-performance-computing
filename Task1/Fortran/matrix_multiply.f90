! ------------------------------------------------------
! Multiply random N:N matrix by random N:1 matrix
! ------------------------------------------------------

PROGRAM Main
  IMPLICIT NONE

  character(len=32)         :: arg
  real                      :: u, startB, finishB, startC, finishC
  integer                   :: i, j, type
  integer, parameter        :: N = 22000
  real, dimension (N,N)     :: A
  real, dimension (N,1)     :: x, b, c
  logical                   :: printMatrixs = .false. ! Change the value in order to print the matrices

  ! ------------------------------------------------------ Get type argument
  call getarg(2, arg)    
  read(arg, "(I1)") type

  ! ------------------------------------------------------ Matrix A
  do i = 1, N
    do j = 1, N
      call random_number(u)
      A(i,j) = u
    end do
  end do


  ! ------------------------------------------------------ Matrix x
  do i = 1, N
    call random_number(u)
    x(i,1) = u
  end do

  ! ------------------------------------------------------ Multiply matrices

  call cpu_time(startB)

  if (type == 1) then
        do i = 1, N
          do j = 1, N
            b(i,1) = b(i,1) + A(i,j) * x(j,1)
          end do
        end do
    else if (type == 0) then
        do j = 1, N
          do i = 1, N
            c(i,1) = c(i,1) + A(i,j) * x(j,1)
          end do
        end do
    else
        CALL EXIT(0)
    end if

    call cpu_time(finishB)


  ! ------------------------------------------------------ Results time
  print *, N, ";", (finishB - startB)

END PROGRAM Main