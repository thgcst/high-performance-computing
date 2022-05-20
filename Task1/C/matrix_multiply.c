#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 1000

double randomNumber() {
    return (double)rand() / (double)RAND_MAX;
}

void generateRandomSquareMatrix(double result[N][N]) {
    int i, j;

    for (i = 0; i < N; i++)
        for (j = 0; j < N; j++)
            result[i][j] = randomNumber();
}

void generateRandomLinearMatrix(double result[N][1]) {
    int i;

    for (i = 0; i < N; i++)
        result[i][0] = randomNumber();
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

int main(int argc, char *argv[]) {
    if (argc != 2 || (atoi(argv[1]) != 0 && atoi(argv[1]) != 1)) {
        printf("Invalid arguments\n\nYour program must have exactly one argument 0 or 1, which stands for:\n  1: ij\n  0: ji\n");
        return 0;
    }
    int type = atoi(argv[1]);

    srand(time(NULL));

    // Generate random Square Matrix
    double A[N][N];
    generateRandomSquareMatrix(A);

    // Generate random Linear Matrix
    double x[N][1];
    generateRandomLinearMatrix(x);

    // Multiply Square Matrix by Linear Matrix
    double b[N][1] = {{0.0}};
    double timeTaken;

    if (type == 1) {
        timeTaken = multiplySquareByLinear_ij(A, x, b);
    } else {
        timeTaken = multiplySquareByLinear_ji(A, x, b);
    }

    printf("%d,%.6f\n", N, timeTaken);

    return 0;
}
