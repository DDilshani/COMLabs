#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

//#define ALPHABET_SIZE (26)
#define ARRAY_SIZE(a) sizeof(a)/sizeof(a[0])
#define CHAR_TO_INDEX(c) ((int)c - (int)'a')

typedef struct TrieNode{
	//struct TrieNode * children[ALPHABET_SIZE]
    struct TrieNode ** children;
    char* label;
    bool isEndOfWord;
    int numChildren;

} TrieNode;

typedef struct TrieNode TrieNode;

TrieNode *createTrieNode();
TrieNode *search(TrieNode *root, char *word, char * prefix);
void traverse(char *prefix, TrieNode *root);
void insert(TrieNode *root, char *word);

// to compare the word with labe and return the mathing number of characters 
int getNextPrefix(char * , char *);
char * getNextWord(char *, int , int );

// here I use the double ponter instead of ponter array becouse number of children don't know