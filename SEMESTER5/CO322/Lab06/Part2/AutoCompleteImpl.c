#include "AutoCompleteImpl.h"

TrieNode *createTrieNode() {
    //TODO implement logic for creating an Trie node

    TrieNode *node = (TrieNode *)malloc(sizeof(TrieNode));

    //Initializing the node
    // node -> children = (TrieNode **)malloc(sizeof(TrieNode *));
    int i;
    for (i = 0; i < ALPHABET_SIZE; i++){
        node -> children[i] = NULL;
    }

    // node -> childrenCount = 0;
    node -> label = NULL;
    node -> isEndOfWord = false;

    return node;
}

TrieNode *createLabeledTrieNode(char *label){

    TrieNode *node = createTrieNode();
    node -> label = (char *)malloc(strlen(label) + 1);
    if (node -> label != NULL){
        strcpy(node -> label, label);
    }
    node -> isEndOfWord = true;
    return node;
}

int breakPoint(char *label, char *word){

    int lenLabel = strlen(label);
    int lenWord = strlen(word);
    int length;

    if (lenWord > lenLabel){
        length = lenLabel;
    } else {
        length = lenWord;
    }

    int breakPoint = 0, i;
    for (i = 0; i < length; i++){
        if (label[i] == word[i]){
            breakPoint++;
        } else {
            break;
        }
    }

    return breakPoint;
}

char * getSubString(char * word, int start, int length){

    char *subString = (char *)malloc(length + 1);
    memcpy(subString, &word[start], length);
    subString[length] = '\0';

    return subString;
}

void insert(TrieNode *root, char *word) {
    //TODO implement logic for inserting a word to the tree

    if (root == NULL){
        return;
    }

    int i = 0, index;
    TrieNode * currentRoot = root;

    // for (i = 0; i < strlen(word); i++){
    while(strlen(word) > 0){


        index = CHAR_TO_INDEX(word[i]);
        TrieNode * child = currentRoot -> children[index];

        if (child == NULL){

            child = createLabeledTrieNode(word);    //create new node with label
            // printf("%s\n", child -> label);
            currentRoot -> children[index] = child;
            return;

        } 
        
        int bp = breakPoint(child -> label, word);

        if (bp == strlen(child -> label)){
            
            if (bp == strlen(word)){
                child -> isEndOfWord = true;
                return;
            }

            char * nextWord = getSubString(word, bp, strlen(word) - bp);
            word = nextWord;
            currentRoot = child;
            break;

        } else {

            char *labelRest = getSubString(child -> label, bp, strlen(child -> label) - bp);
            TrieNode *nextChild = createLabeledTrieNode(labelRest);
            memcpy(nextChild -> children, child -> children, sizeof(TrieNode*)*ALPHABET_SIZE);
            // nextChild -> children[] = child -> children[];
            nextChild -> isEndOfWord = child -> isEndOfWord;
            int nextChildIndex = CHAR_TO_INDEX(labelRest[0]);

            child -> label = getSubString(child -> label, 0, bp);
            child -> children[nextChildIndex] = nextChild;
            child -> isEndOfWord = false;

            if (bp == strlen(word)){
                child -> isEndOfWord = true;
                return;
            }

            char *nextWord = getSubString(word, bp, strlen(word) - bp);
            nextChildIndex = CHAR_TO_INDEX(nextWord[0]);
            child -> children[nextChildIndex] = createLabeledTrieNode(nextWord);
            return;

        }
        
    }
}

TrieNode *search(TrieNode *root, char *word) {
    //TODO implement search logic for Tries tree.
    //TODO This function should return last node of the node sequence where we found given word
    if (root == NULL){
        return NULL;
    }

    int index;
    TrieNode * currentRoot = root;
    
    while (strlen(word) > 0){

        index = CHAR_TO_INDEX(word[0]);
        TrieNode *child = currentRoot -> children[index];
        bool found = false;

        if (!child){
            return NULL;
        }

        int bp = breakPoint(child -> label, word);

        if (bp > 0){
            
            if (bp == strlen(word)){
                found = true;
                // printf("return child\n");
                return child;

            } else {

                word = getSubString(word, bp, strlen(word) - bp);
                currentRoot = child;
                found = true;
                break;
            }
        }
        
        if (!found){
            return NULL;
        }
    }

    return currentRoot;
}

void traverse(char prefix[], TrieNode *root) {
    //TODO implement tree traversal logic here. Use this to traverse underneath tree
    //TODO TIP: use this function to print words once you find the node in search function
    if (root == NULL){
        return;
    }

    TrieNode * currentRoot = root;
    int i;

    if(currentRoot -> isEndOfWord){
        // for (i = 0; i < size; i++){
        printf("%s\n", prefix);
        // }
        // printf("\n");
    }

    int current = strlen(prefix);

    for (i = 0; i < ALPHABET_SIZE; i++){
        TrieNode *child = currentRoot -> children[i];
        
        if (child != NULL){

            prefix[current] = '\0';
            strcat(prefix, child -> label); // insert the current nodes label to the prefix
            // printf("%s\n", prefix);
            traverse(prefix, child); // traverse the rest of the tree

        }
    }
    
}