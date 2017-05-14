#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#define ALPHABET_SIZE (26)
#define ARRAY_SIZE(a) sizeof(a)/sizeof(a[0])
#define CHAR_TO_INDEX(c) ((int)c - (int)'a')

typedef struct TrieNode{
    struct TrieNode **children;
    int childrenCount;
    char *label;
    bool isEndOfWord;
} TrieNode;

// Helper Functions

// Function to compare two strings and get the last index of the matching prefix
int getBreakPoint(char *label, char *word);

// Function to split the given string from given index upto a given length
char * SplitString(char * word, int start, int length);

TrieNode *createTrieNode();
TrieNode *search(TrieNode *root, char *word, char *prefix);
void traverse(char prefix[], TrieNode *root);
void insert(TrieNode *root, char *word);

