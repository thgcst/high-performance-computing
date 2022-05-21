#include <stdio.h>
#include <stdlib.h>
#include <time.h>

double randomNumber() {
    return (double)rand() / (double)RAND_MAX;
}

double *zeroVector(int N) {
    double *vector = (double *)malloc(N * sizeof(double));
    for (int i = 0; i <= N; i++)
        vector[i] = 0;

    return vector;
}

double *multiplySquareByLinear_ij(double **A, double *x, int N) {
    double *b = zeroVector(N);

    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            b[i] += A[i][j] * x[j];
        }
    }

    return b;
}

double *multiplySquareByLinear_ji(double **A, double *x, int N) {
    double *b = zeroVector(N);

    for (int j = 0; j < N; j++) {
        for (int i = 0; i < N; i++) {
            b[i] += A[i][j] * x[j];
        }
    }

    return b;
}

int printB(double *b, int N) {
    for (int i = 0; i < N; i++) {
        printf("%f ", b[i]);
    }
    return 1;
}

int main(int argc, char *argv[]) {
    if (argc != 3 || (atoi(argv[2]) != 0 && atoi(argv[2]) != 1)) {
        printf("Invalid arguments\n\nYour program must have exactly two arguments. First argument stands for the order of the square matrix. Second argument must be 0 or 1, which stands for:\n - 1: ij\n - 0: ji\n");
        return 0;
    }
    int N = atoi(argv[1]);
    int type = atoi(argv[2]);

    srand(time(NULL));

    // Declare A, x and b
    double **A = (double **)malloc(N * sizeof(double *));
    double *x = (double *)malloc(N * sizeof(double));
    double *b;

    // Populate A and b with random numbers
    for (int i = 0; i < N; i++) {
        A[i] = (double *)malloc(N * sizeof(double));
        for (int j = 0; j < N; j++) {
            A[i][j] = randomNumber();
        }
        x[i] = randomNumber();
    };

    // Multiply matrices

    clock_t start, finish;

    start = clock();
    if (type == 1) {
        b = multiplySquareByLinear_ij(A, x, N);
    } else {
        b = multiplySquareByLinear_ji(A, x, N);
    }
    finish = clock();

    // Free A
    for (int i = 0; i < N; i++) {
        free(A[i]);
    }
    free(x);
    free(b);

    printf("%d,%.6f", N, ((double)(finish - start)) / CLOCKS_PER_SEC);

    return 0;
}
