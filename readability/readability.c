#include <cs50.h>
#include <ctype.h>
#include <math.h>
#include <stdio.h>
#include <string.h>

int count_letter(string text);
int count_word(string text);
int count_sentences(string text);

int main(void)
{
    // Prompt the user for some text
    string Text = get_string("Text: ");

    // Count the number of letters, words, and sentences in the text
    int num_letter = count_letter(Text);
    int num_word = count_word(Text);
    int sentences = count_sentences(Text);

    // Compute the Coleman-Liau index
    float L = ((float) num_letter / (float) num_word) *
              100.0; // average number of letters per 100 words in the text
    float S = ((float) sentences / (float) num_word) *
               100.0; // the average number of sentences per 100 words in the text
    float index = 0.0588 * L - 0.296 * S - 15.8;

    // Print the grade level
    if (index < 1)
    {
        printf("Before Grade 1\n");
    }
    else if (index >= 16)
    {
        printf("Grade 16+\n");
    }
    else
    {
        printf("Grade %d\n", (int) round(index));
    }
}

int count_letter(string text)
{
    int letters = 0;
    for (int i = 0, len = strlen(text); i < len; i++)
    {
        if (isalpha(text[i]))
        {
            letters++;
        }
    }
    return letters;
}

int count_word(string text)
{
    int words = 1;
    for (int i = 0, len = strlen(text); i < len; i++)
    {
        if (text[i] == ' ')
        {
            words++;
        }
    }
    return words;
}

int count_sentences(string text)
{
    int sentence = 0;
    for (int i = 0, len = strlen(text); i < len; i++)
    {
        if (text[i] == '.' || text[i] == '!' || text[i] == '?')
        {
            sentence++;
        }
    }    return sentence;
}
