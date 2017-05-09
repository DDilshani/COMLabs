#include "AutoCompleteImpl.h"

TrieNode *createTrieNode() {
    //TODO implement logic for creating an Trie node

    TrieNode *node = (TrieNode *)malloc(sizeof(TrieNode));

    //Initializing the node
    int i;
    for (i = 0; i < ALPHABET_SIZE; i++){
        node -> children[i] = NULL;
    }

    node -> label = 0;
    node -> isEndOfWord = false;

    return node;
}

void insert(TrieNode *root, const char *word) {
    //TODO implement logic for inserting a word to the tree

    if (root == NULL){
        return;
    }

    int i, index;
    TrieNode * currentRoot = root;

    for (i = 0; i < strlen(word); i++){

        index = CHAR_TO_INDEX(word[i]);
        TrieNode * child = currentRoot -> children[index];

        if (child == NULL){

            child = createTrieNode();	//create new node
            child -> label = word[i];
            currentRoot -> children[index] = child;
        } 

        currentRoot = child;
        
    }

    // Mark the last node as a leaf
    currentRoot -> isEndOfWord = true;
}

TrieNode *search(TrieNode *root, const char *word) {
    //TODO implement search logic for Tries tree.
    //TODO This function should return last node of the node sequence where we found given word

    int i, index;
    TrieNode * currentRoot = root;
    
    for (i = 0; i < strlen(word); i++){

        index = CHAR_TO_INDEX(word[i]);
        TrieNode *child = currentRoot -> children[index];

        if (!child){
            return NULL;
        }
        // if (!(child -> isEndOfWord) && (child)) {

        currentRoot = child;
        // }

    }

    return currentRoot;
}

void traverse(char prefix[], TrieNode *root, int size) {
    //TODO implement tree traversal logic here. Use this to traverse underneath tree
    //TODO TIP: use this function to print words once you find the node in search function
     if (root == NULL){
        return;
    }

    TrieNode * currentRoot = root;
    int i;

    if(currentRoot -> isEndOfWord){
        for (i = 0; i < size; i++){
            printf("%c", prefix[i]);
        }
        printf("\n");
    }

    

    for (i = 0; i < ALPHABET_SIZE; i++){
        TrieNode *child = currentRoot -> children[i];
        
        if (child != NULL){

            prefix[size] = child -> label; // insert the current nodes label to the prefix
            traverse(prefix, child, size + 1); // traverse the rest of the tree

        }
    }
    
}