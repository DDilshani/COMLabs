#include "AutoCompleteImpl.h"

TrieNode *createTrieNode() {
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

			// relRoot -> children = (TrieNode *)(sizeof(TrieNode) * ALPHABET_SIZE);
			TrieNode * child = (TrieNode *) relRoot -> children[index];
            child = createTrieNode();
			child -> label = word[i];
            // relRoot = child;

        } 

        relRoot = (TrieNode*) relRoot -> children[index];
           
  //       } else {

  //           TrieNode * child = relRoot -> children[index]; 
  //           if(!child){
  //               child = createTrieNode();
  //           }

  //           child -> label = word[i];
  //           relRoot = child;

		// }
    	
    }

    relRoot -> isEndOfWord = true;
}

TrieNode *search(TrieNode *root, const char *word) {
    //TODO implement search logic for Tries tree.
    //TODO This function should return last node of the node sequence where we found given word
    int i;
    
    for (i = 0; i < ARRAY_SIZE(word); i++){

    }


    return NULL;
}

void traverse(char prefix[], TrieNode *root) {
    //TODO implement tree traversal logic here. Use this to traverse underneath tree
    //TODO TIP: use this function to print words once you find the node in search function
}