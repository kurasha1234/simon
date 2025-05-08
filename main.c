#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LEN 100

extern char get_random_char();
extern void delay();
extern int compare_sequences(const char* a, const char* b, int len);

char sequence[MAX_LEN];
char input[MAX_LEN];

void show_sequence(int len) {
    printf("\nSequence:\n");
    for (int i = 0; i < len; ++i) {
        printf("%c ", sequence[i]);
        fflush(stdout);
        delay();
    }
    printf("\n");
}

void get_user_input(int len) {
    printf("Repeat the sequence: ");
    for (int i = 0; i < len; ++i) {
        scanf(" %c", &input[i]);
    }
}

int main() {
    int len = 1;
    printf("🎮 Welcome to Simon Game (AT&T Format)\n");

    while (1) {
        sequence[len - 1] = get_random_char();
        show_sequence(len);
        get_user_input(len);

        if (!compare_sequences(sequence, input, len)) {
            printf("❌ Wrong! Game Over.\n");
            break;
        }

        printf("✅ Correct!\n");
        len++;
    }

    return 0;
}
