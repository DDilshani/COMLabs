#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#define ALPHABET_SIZE (26)
#define ARRAY_SIZE(a) sizeof(a)/sizeof(a[0])
#define CHAR_TO_INDEX(c) ((int)c - (int)'a')

typedef struct trienode{
    struct trienode *children[ALPHABET_SIZE];
    // struct TrieNode *children;
    char label;
    bool isEndOfWord;
} TrieNode;


TrieNode *createNode();
TrieNode *search(TrieNode *root, const char *word);
void traverse(char prefix[], TrieNode *root);
void insert(TrieNode *root, const char *word);