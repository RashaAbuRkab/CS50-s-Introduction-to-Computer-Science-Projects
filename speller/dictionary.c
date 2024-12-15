// Implements a dictionary's functionality

#include <ctype.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int strcasecmp(const char *s1, const char *s2);

#include "dictionary.h"

// Represents a node in a hash table
typedef struct node
{
    char word[LENGTH + 1];
    struct node *next;
} node;

// TODO: Choose number of buckets in hash table
const unsigned int N = 26;

// Hash table
node *table[N];

// Returns true if word is in dictionary, else false
bool check(const char *word)
{
    char lower_word[LENGTH + 1];
    for (int i = 0; word[i]; i++)
    {
        lower_word[i] = tolower(word[i]);
    }
    lower_word[strlen(word)] = '\0';

    unsigned int index = hash(lower_word);
    node *cursor = table[index];

    while (cursor != NULL)
    {
        if (strcasecmp(cursor->word, lower_word) == 0)
        {
            return true;
        }
        cursor = cursor->next;
    }

    return false;
}


unsigned int word_count = 0;

// Hashes word to a number
unsigned int hash(const char *word)
{
    unsigned long hash = 5381;
    int c;
    while ((c = *word++))
    {
        hash = ((hash << 5) + hash) + tolower(c);  // hash * 33 + c
    }
    return hash % N;
}

// Loads dictionary into memory, returning true if successful, else false
bool load(const char *dictionary)
{
    FILE *source = fopen(dictionary, "r");
    if (source == NULL)
    {
        fprintf(stderr, "Could not open dictionary file.\n");
        return false;
    }

    // Initialize hash table
    for (int i = 0; i < N; i++)
    {
        table[i] = NULL;
    }

    char word[LENGTH + 1];
    while (fscanf(source, "%s", word) != EOF)
    {
        char lower_word[LENGTH + 1];
        for (int i = 0; word[i]; i++)
        {
            lower_word[i] = tolower(word[i]);
        }
        lower_word[strlen(word)] = '\0';

        node *new_node = malloc(sizeof(node));
        if (new_node == NULL)
        {
            fprintf(stderr, "Memory allocation failed.\n");
            fclose(source);
            return false;
        }

        strcpy(new_node->word, lower_word);
        unsigned int index = hash(lower_word);
        new_node->next = table[index];
        table[index] = new_node;

        word_count++;
    }

    fclose(source);
    return true;
}


// Returns number of words in dictionary if loaded, else 0 if not yet loaded
unsigned int size(void)
{

    return word_count;
}

// Unloads dictionary from memory, returning true if successful, else false
bool unload(void)
{
    for (int i = 0; i < N; i++)
    {
        node *cursor = table[i];
        while (cursor != NULL)
        {
            node *temp = cursor;
            cursor = cursor->next;
            free(temp);
        }
    }
    return true;

}
