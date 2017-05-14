#include "AutoCompleteImpl.h"

#define NUMBER_OF_WORDS (354935)
#define INPUT_WORD_SIZE (100)

char *receiveInput(char *s) {
    scanf("%99s", s);  // scan a character array
    return s;
}

int main() {
    int word_count = 0;
    
    char* words[NUMBER_OF_WORDS];  // store a pointer array in the stack this can also done in the heap using double pointer
    

    FILE *fp = fopen("resources/dictionary.txt", "r");
    if (fp == 0){
        fprintf(stderr, "Error while opening dictionary file");
        exit(1);
    }

    //here all the stack pointer can make a pointer to heap and store the word characters as allocated space
    // this is like a 2D matrix in the heap and all the stack pointer can pointer each row in the matrix

    words[word_count] = malloc(INPUT_WORD_SIZE);

    while (fgets(words[word_count], INPUT_WORD_SIZE, fp)) {
        // scan the file and put the words in to the heap
        word_count++;
        words[word_count] = malloc(INPUT_WORD_SIZE);
    }

    // create the the root node
    TrieNode * root = createTrieNode();

    int i = 0;

    for(i = 0; i < NUMBER_OF_WORDS; i++){	
        // in C strcspn can check the string patterns and return length up to that chracter/String
        // this will identify the end of the word using the trrminating \0 character
    	words[i][strcspn(words[i], "\r\n")] = 0;  // asign the  '\0' character

        insert(root, words[i]);
    }
    


    while (1) {
        printf("\n\nEnter keyword: ");

        char str[100];
        receiveInput(str);
        printf("\n==========================================================\n");
        printf("\n********************* Possible Words *********************\n\n");

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

        printf("\n==========================================================\n");
    }



    return 0;

}




    




























    

