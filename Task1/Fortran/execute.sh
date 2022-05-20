CSV_PATH_IJ=size_time_ij.csv
CSV_PATH_JI=size_time_ji.csv

gfortran matrix_multiply.f90 -o matrix_multiply

echo $(./matrix_multiply 1) >> $CSV_PATH_IJ
echo $(./matrix_multiply 0) >> $CSV_PATH_JI

rm matrix_multiply