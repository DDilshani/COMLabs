#include "AutoCompleteImpl.h"

struct TrieNode *createTrieNode() {
    //TODO implement logic for creating an Trie node
    TrieNode *node = (TrieNode *)malloc(sizeof(TrieNode));

    node -> children = NULL;
    node -> label = null;
    isEndOfWord = false;

    return node;
}

void insert(struct TrieNode *root, const char *word) {
    //TODO implement logic for inserting a word to the tree
    for (int i = 0; i < ARRAY_SIZE(word); i++){

		if (root -> children == NULL){

			children = (TrieNode *)(sizeof(TrieNode) * ALPHABET_SIZE);
			TrieNode * child = children[CHAR_TO_INDEX(word[i])];
			child -> label = word[i];
			children -> isEndOfWord = false;
			
		} else {

			TrieNode * child = children[CHAR_TO_INDEX(word[i])]; 
		}
    	
    }
}

struct TrieNode *search(struct TrieNode *root, const char *word) {
    //TODO implement search logic for Tries tree.
    //TODO This function should return last node of the node sequence where we found given word
}

void traverse(char prefix[], struct TrieNode *root) {
    //TODO implement tree traversal logic here. Use this to traverse underneath tree
    //TODO TIP: use this function to print words once you find the node in search function
}