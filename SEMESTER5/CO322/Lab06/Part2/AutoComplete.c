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
    TrieNode *root = createTrieNode();
    // printf("%p\n",(void*)root );
    root -> label = "*";	//Marking the root node
    int i;
    for (i = 0; i < NUMBER_OF_WORDS; i++){
    	char *word = words[i];
    	int length = strcspn(word, "\r\n");	// get the length of the string eliminating CR and LF
    	word[length] = 0; // trim the word length by inseting null character
        insert(root, word);
        // printf("%s\n", word);
    }

    while (1) {
        printf("Enter keyword: ");
        char str[100];
        receiveInput(str);
        printf("\n==========================================================\n");
        printf("\n********************* Possible Words ********************\n");

        //TODO traverse the tree and provide possible word list
        char *nodeChar = (char*)malloc(100); 
        nodeChar[0] = '\0';

        TrieNode * prefix_end_node; // last node in the matching process
        // get the node that equal to final character of prefix
        prefix_end_node = search(root, str, nodeChar);


        if(prefix_end_node != NULL){
            // this will add together the maching characters and lable of the final node
            strcat(nodeChar, prefix_end_node->label);
        }

        if(prefix_end_node == NULL){
            printf("\n  **** Sorry there is no any maching word as, %s **** \n\n",str );
        }

        traverse(nodeChar, prefix_end_node);

        printf("==========================================================\n");
    }
}