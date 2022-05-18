#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 1000
#define print 1

void generateRandomSquareMatrix(int result[N][N]) {
    int i, j;

    for (i = 0; i < N; i++)
        for (j = 0; j < N; j++)
            result[i][j] = rand() % 10;
}

void printSquareMatrix(int matrix[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            printf("%d ", matrix[i][j]);
        }
        printf("\n");
    }
}

void generateRandomLinearMatrix(int result[N][1]) {
    int i;

    for (i = 0; i < N; i++)
        result[i][0] = rand() % 10;
}

void printLinearMatrix(int matrix[N][1]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < 1; j++) {
            printf("%d ", matrix[i][j]);
        }
        printf("\n");
    }
}

void multiplySquareByLinear(int A[N][N], int x[N][1], int result[N][1]) {
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
    printf("multiplySquareByLinear() took %f seconds to execute \n", time_taken);
}

void multiplySquareByLinear2(int A[N][N], int x[N][1], int result[N][1]) {
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
    printf("multiplySquareByLinear2() took %f seconds to execute \n", time_taken);
}

int main() {
    srand(time(NULL));

    // Generate random Square Matrix
    int A[N][N];
    generateRandomSquareMatrix(A);

    if (print) {
        printf("Matriz A:\n");
        printSquareMatrix(A);

        printf("\n");
    }

    // Generate random Linear Matrix
    int x[N][1];
    generateRandomLinearMatrix(x);

    if (print) {
        printf("Matriz x:\n");
        printLinearMatrix(x);

        printf("\n");
    }

    // Multiply Square Matrix by Linear Matrix
    int b[N][1] = {{0}};
    int c[N][1] = {{0}};
    multiplySquareByLinear(A, x, b);
    multiplySquareByLinear2(A, x, c);

    printf("\n");

    if (print) {
        printf("Matriz b:\n");
        printLinearMatrix(b);

        printf("Matriz c:\n");
        printLinearMatrix(c);

        printf("\n");
    }

    return 0;
}
