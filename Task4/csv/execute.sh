INPUT_PATH=input.txt
OUTPUT_PATH=output.csv

MAX_THREADS=8

echo 'Nx;Result;Time(s);Flags;Thread' > $OUTPUT_PATH

echo "Versão: puramente serial..."
g++-11 ./laplace.cxx -o laplace 
for nx in 512 1024 2048;
do
    echo $nx 1000 0.0000000000000001 "Puramente_serial" > $INPUT_PATH
    echo $(./laplace < $INPUT_PATH >> $OUTPUT_PATH) "Nx = $nx"
done

echo "Versão: código com vetorização (-O3)..."
g++-11 ./laplace.cxx -O3 -o laplace
for nx in 512 1024 2048;
do
    echo $nx 1000 0.0000000000000001 "-O3" > $INPUT_PATH
    echo $(./laplace < $INPUT_PATH >> $OUTPUT_PATH) "Nx = $nx"
done

echo "Versão: código com paralelismo de threads (-fopenmp)..."
g++-11 ./laplace_omp.cxx -fopenmp -o laplace 
for threads in $(seq 1 $MAX_THREADS);
do
    echo "Número de threads: $threads"
    export OMP_NUM_THREADS=$threads
    for nx in 512 1024 2048;
    do
        echo $nx 1000 0.0000000000000001 "-fopenmp" > $INPUT_PATH
        echo $(./laplace < $INPUT_PATH >> $OUTPUT_PATH) "Nx = $nx"
    done
done

echo "Versão: código com paralelismo de threads + vetorização (-fopenmp -O3)..."
g++-11 ./laplace_omp.cxx -O3 -fopenmp -o laplace 
for threads in $(seq 1 $MAX_THREADS);
do
    echo "Número de threads: $threads"
    export OMP_NUM_THREADS=$threads
    for nx in 512 1024 2048;
    do
        echo $nx 1000 0.0000000000000001 "-fopenmp,-03" > $INPUT_PATH
        echo $(./laplace < $INPUT_PATH >> $OUTPUT_PATH) "Nx = $nx"
    done
done

rm $INPUT_PATH
rm laplace