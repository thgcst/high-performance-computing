#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 1000
#define print 0

double randomNumber() {
    return (double)rand() / (double)RAND_MAX;
}

void generateRandomSquareMatrix(double result[N][N]) {
    int i, j;

    for (i = 0; i < N; i++)
        for (j = 0; j < N; j++)
            result[i][j] = randomNumber();
}

void printSquareMatrix(double matrix[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            printf("%f ", matrix[i][j]);
        }
        printf("\n");
    }
}

void generateRandomLinearMatrix(double result[N][1]) {
    int i;

    for (i = 0; i < N; i++)
        result[i][0] = randomNumber();
}

void printLinearMatrix(double matrix[N][1]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < 1; j++) {
            printf("%f ", matrix[i][j]);
        }
        printf("\n");
    }
}

double multiplySquareByLinear_ij(double A[N][N], double x[N][1], double result[N][1]) {
    clock_t t;
    t = clock();

    int i, j;
    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            result[i][0] += A[i][j] * x[j][0];
        }
    }

    t = clock() - t;
    double time_taken = ((double)t) / CLOCKS_PER_SEC;  // in seconds
    return time_taken;
}

double multiplySquareByLinear_ji(double A[N][N], double x[N][1], double result[N][1]) {
    clock_t t;
    t = clock();

    int i, j;
    for (j = 0; j < N; j++) {
        for (i = 0; i < N; i++) {
            result[i][0] += A[i][j] * x[j][0];
        }
    }

    t = clock() - t;
    double time_taken = ((double)t) / CLOCKS_PER_SEC;  // in seconds
    return time_taken;
}

int main() {
    srand(time(NULL));

    // Generate random Square Matrix
    double A[N][N];
    generateRandomSquareMatrix(A);

    if (print) {
        printf("Matriz A:\n");
        printSquareMatrix(A);

        printf("\n");
    }

    // Generate random Linear Matrix
    double x[N][1];
    generateRandomLinearMatrix(x);

    if (print) {
        printf("Matriz x:\n");
        printLinearMatrix(x);

        printf("\n");
    }

    // Multiply Square Matrix by Linear Matrix
    double b[N][1] = {{0.0}};
    double c[N][1] = {{0.0}};
    double timeTaken_ij, timeTaken_ji;

    timeTaken_ij = multiplySquareByLinear_ij(A, x, b);
    timeTaken_ji = multiplySquareByLinear_ji(A, x, b);

    if (print) {
        printf("\n");
        printf("Matriz b:\n");
        printLinearMatrix(b);

        printf("\n");
    }

    printf("%d,%.6f,%.6f\n", N, timeTaken_ij, timeTaken_ji);

    return 0;
}
