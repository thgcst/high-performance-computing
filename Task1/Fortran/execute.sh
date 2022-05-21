CSV_PATH_IJ=size_time_ij.csv
CSV_PATH_JI=size_time_ji.csv

echo "Size,ij time(s)" >> $CSV_PATH_IJ
echo "Size,ji time(s)" >> $CSV_PATH_JI

gfortran matrix_multiply.f90 -o matrix_multiply

for N in $(seq 4000 6000 40000)
  do 
      echo $(./matrix_multiply $N 1) >> $CSV_PATH_IJ
      echo $(./matrix_multiply $N 0) >> $CSV_PATH_JI
 done

rm matrix_multiply