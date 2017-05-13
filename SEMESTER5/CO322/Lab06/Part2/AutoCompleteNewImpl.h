#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#define ALPHABET_SIZE (26)
#define ARRAY_SIZE(a) sizeof(a)/sizeof(a[0])
#define CHAR_TO_INDEX(c) ((int)c - (int)'a')

typedef struct TrieNode{
    char *label;
    int length;
    struct TrieNode *sister;
    struct TrieNode *parent;
} TrieNode;


TrieNode *createTrieNode();
TrieNode *createLabeledTrieNode(char *label, int n);
int breakPoint(char *label, int n, char *word, int m);
void split(TrieNode *t, int k);
void insert(TrieNode *root, char *word, int n);
TrieNode *search(TrieNode *root, char *word, int n);

// void traverse(char prefix[], TrieNode *root);
