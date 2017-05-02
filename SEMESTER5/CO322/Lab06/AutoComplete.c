#include "AutoCompleteImpl.h"

#define NUMBER_OF_WORDS (354935)
#define INPUT_WORD_SIZE (100)

char *receiveInput(char *s) {
    scanf("%99s", s);
    return s;
}

int main() {
    int word_count = 0;
    char* words[NUMBER_OF_WORDS];

    FILE *fp = fopen("resources/dictionary.txt", "r");
    if (fp == 0){
        fprintf(stderr, "Error while opening dictionary file");
        exit(1);
    }
    words[word_count] = malloc(INPUT_WORD_SIZE);
    while (fgets(words[word_count], INPUT_WORD_SIZE, fp)) {
        word_count++;
        words[word_count] = malloc(INPUT_WORD_SIZE);
    }

    //TODO populate tree with word list
    TrieNode *root = createNode();
    // int i;
    // for (i = 0; i < 26; i++){
    //     printf("%d\n", root -> children[i] -> isEndOfWord );
    // }
    // insert(root, words[0]);

    while (1) {
        printf("Enter keyword: ");
        char str[100];
        receiveInput(str);
        printf("\n==========================================================\n");
        printf("\n********************* Possible Words ********************\n");

        //TODO traverse the tree and provide possible word list

        printf("==========================================================\n");
    }
}