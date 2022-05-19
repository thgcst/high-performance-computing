CSV_PATH_IJ=size_time_ij.csv
CSV_PATH_JI=size_time_ji.csv

gcc matrix_multiply.c -o matrix_multiply

echo $(./matrix_multiply 1) >> $CSV_PATH_IJ
echo $(./matrix_multiply 0) >> $CSV_PATH_JI

rm matrix_multiply