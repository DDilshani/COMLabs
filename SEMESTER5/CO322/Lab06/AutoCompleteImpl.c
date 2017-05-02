#include "AutoCompleteImpl.h"

TrieNode *createNode() {
    //TODO implement logic for creating an Trie node
    TrieNode *node = (TrieNode *)malloc(sizeof(TrieNode));

    int j;
    for (j = 0; j < ALPHABET_SIZE; j++){
        node -> children[j] = NULL;
    }

    // node -> children = NULL;
    node -> label = 0;
    node -> isEndOfWord = false;

    return node;
}

void insert(TrieNode *root, const char *word) {
    //TODO implement logic for inserting a word to the tree

    int i;
    TrieNode * relRoot = root;

    for (i = 0; i < ARRAY_SIZE(word); i++){

        int index = CHAR_TO_INDEX(word[i]);

        if (relRoot -> children[index] == NULL){

            TrieNode * child = (TrieNode *) relRoot -> children[index];
            child = createNode();
            child -> label = word[i];

        } 

        relRoot = (TrieNode*) relRoot -> children[index];
        
    }

    // Make the last node a leaf
    relRoot -> isEndOfWord = true;
}

TrieNode *search(TrieNode *root, const char *word) {
    //TODO implement search logic for Tries tree.
    //TODO This function should return last node of the node sequence where we found given word
    int i;
    TrieNode * relRoot = root;
    
    for (i = 0; i < ARRAY_SIZE(word); i++){

        int index = CHAR_TO_INDEX(word[i]);

        if (!(relRoot -> isEndOfWord) && (relRoot -> children[index])) {

            relRoot = relRoot -> children[index];
        }

    }

    return relRoot;
}

void traverse(char prefix[], TrieNode *root) {
    //TODO implement tree traversal logic here. Use this to traverse underneath tree
    //TODO TIP: use this function to print words once you find the node in search function
    TrieNode * relRoot = search(root, prefix);

    if(relRoot -> isEndOfWord){
        printf("%s\n", prefix);
    }

}