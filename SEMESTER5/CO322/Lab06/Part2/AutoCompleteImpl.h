#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

typedef struct TrieNode{
    struct TrieNode **children;
    int childrenCount;
    char *label;
    bool isEndOfWord;
} TrieNode;

TrieNode *createTrieNode();
TrieNode *search(TrieNode *root, char *word, char *prefix);
void traverse(TrieNode *root, char prefix[]);
void insert(TrieNode *root, char *word);

// Helper Functions
int getBreakPoint(char *label, char *word);
char * SplitString(char * word, int start, int length);
void addAsChild(TrieNode *parent, TrieNode *child);
