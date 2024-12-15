#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, string argv[])
{
    // Ensure correct usage: exactly one command-line argument and all characters should be digits
    if (argc != 2)
    {
        printf("Usage: ./caesar key\n");
        return 1;
    }

    // Check if the key contains only digits
    for (int i = 0; argv[1][i] != '\0'; i++)
    {
        if (!isdigit(argv[1][i]))
        {
            printf("Usage: ./caesar key\n");
            return 1;
        }
    }

    // Convert key to an integer and use modulo 26 to handle large values
    int k = atoi(argv[1]) % 26;

    // Prompt user for plaintext
    string plaintext = get_string("plaintext: ");

    // Output the ciphertext
    printf("ciphertext: ");
    for (int i = 0, len = strlen(plaintext); i < len; i++)
    {
        if (isalpha(plaintext[i]))
        {
            // Determine if the letter is uppercase or lowercase
            char offset = isupper(plaintext[i]) ? 'A' : 'a';

            // Encrypt and wrap-around the letter
            printf("%c", (plaintext[i] - offset + k) % 26 + offset);
        }
        else
        {
            // Non-alphabetical characters remain unchanged
            printf("%c", plaintext[i]);
        }
    }

    printf("\n");
    return 0;
}
