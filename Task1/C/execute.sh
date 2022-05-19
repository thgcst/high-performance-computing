CSV_PATH=size_time.csv

gcc matrix_multiply.c -o matrix_multiply

echo $(./matrix_multiply) >> $CSV_PATH

rm matrix_multiply