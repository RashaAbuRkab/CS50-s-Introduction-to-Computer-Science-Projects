#include <cs50.h>
#include <stdio.h>

void print_row(int spaces, int bricks);

int main(void)
{
    // Prompt the user for the pyramid's height
    int n;
    do
    {
        n = get_int("Height: ");
    }
    while (n>8 || n < 1 );
    // Print a pyramid of that height
    for (int i = 0; i < n; i++)
    {
        print_row( i+1 , n);

    }
}

void print_row(int spaces, int bricks)
{
    int m = bricks - spaces;
    // Print spaces
    for(int j=0; j<m; j++)
    {
        printf(" ");

    }
        // Print bricks
    for(int a=0; a<(bricks - m);a++)
    {
        printf("#");

    }
    printf("\n");
}
