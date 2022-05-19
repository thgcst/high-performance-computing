CSV_PATH=size_time.csv

gfortran matrix_multiply.f90 -o matrix_multiply

echo $(./matrix_multiply) >> $CSV_PATH

rm matrix_multiply