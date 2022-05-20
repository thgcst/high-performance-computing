! ------------------------------------------------------
! Multiply random N:N matrix by random N:1 matrix
! ------------------------------------------------------

PROGRAM Main
  IMPLICIT NONE

  character(len=32)                     :: arg
  real                                  :: u, startB, finishB
  integer                               :: i, j, N, type
  real, dimension (:,:), allocatable    :: A
  real, dimension (:), allocatable      :: x, b

  ! ------------------------------------------------------ Get N argument
  call getarg(1, arg)    
  read(arg, "(I10)") N

  ! ------------------------------------------------------ Get type argument
  call getarg(2, arg)    
  read(arg, "(I1)") type

  ! ------------------------------------------------------ Initialize variables and seed random number 
  allocate(A(N, N))
  allocate(x(N))
  allocate(b(N))

  call random_seed()

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
    x(i) = u
  end do

  ! ------------------------------------------------------ Multiply matrices

  call cpu_time(startB)

  if (type == 1) then
        do i = 1, N
          do j = 1, N
            b(i) = b(i) + A(i,j) * x(j)
          end do
        end do
    else if (type == 0) then
        do j = 1, N
          do i = 1, N
            b(i) = b(i) + A(i,j) * x(j)
          end do
        end do
    else
        CALL EXIT(0)
    end if

  call cpu_time(finishB)

  ! ------------------------------------------------------ Deallocate memory
  deallocate(A)
  deallocate(x)
  deallocate(b)

  ! ------------------------------------------------------ Results time
  print *, N, ",", (finishB - startB)

END PROGRAM Main