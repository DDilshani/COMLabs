#include "AutoCompleteNewImpl.h"

TrieNode *createTrieNode() {
    //TODO implement logic for creating an Trie node

    TrieNode *node = (TrieNode *)malloc(sizeof(TrieNode));

    //Initializing the node
    // node -> children = (TrieNode **)malloc(sizeof(TrieNode *));

    // node -> childrenCount = 0;
    node -> label = NULL;
    node -> length = 0;
    node -> parent = NULL;
    node -> sister = NULL;

    return node;
}

TrieNode *createLabeledTrieNode(char *label, int n){

    TrieNode *node = createTrieNode();
    node -> label = (char *)malloc(n);
    strncpy(node->label, label, n);
    return node;
}

int breakPoint(char *label, int n, char *word, int m){

    int i;
    for (i = 0; i < n; i++){
        if ( i == m || label[i] != word[i]){
            return i;
        } 
    }

    return n;
}

void split(TrieNode *t, int k){

    TrieNode * p = createLabeledTrieNode(t -> label+k, t -> length-k);
    p -> parent = t -> parent;
    t -> parent = p;
    char * a = (char *)malloc(k);
    strncpy(a, t -> label, k);
    t -> label = a;
    t -> length = k;
    
}

TrieNode* insert(TrieNode *root, char *word, int n) {
    //TODO implement logic for inserting a word to the tree
    if (!n){
        n = strlen(word) + 1;
    }

    if (!root){
        return createLabeledTrieNode(word, n);
    }

    int k = breakPoint(word, n, root -> label, root -> length);

    if (k == 0){
        root -> sister = insert( root -> sister, word, n);     
    } else if (k < n){
        
        if (k < root -> length){
            split(root, k);
        }
        root -> parent = insert(root -> parent, word+k, n-k);
    }

    return root;
}

TrieNode *search(TrieNode *root, char *word, int n) {
    //TODO implement search logic for Tries tree.
    //TODO This function should return last node of the node sequence where we found given word
    if (!n){
        n = strlen(word) + 1;
    }
    if (!root){
       return 0;
    }

    int k = breakPoint(word, n, root -> label, root -> length);
    
    if (k == 0){
       return search(root -> sister, word, n);
    }

    if (k == n){
       return root;
    }

    if (k == root -> length){
       return search(root -> parent, word+k, n-k);
    }

    return 0;
}

// void traverse(char prefix[], TrieNode *root) {
//     //TODO implement tree traversal logic here. Use this to traverse underneath tree
//     //TODO TIP: use this function to print words once you find the node in search function
//     if (root == NULL){
//         return;
//     }

//     TrieNode * currentRoot = root;
//     int i;

//     if(currentRoot -> isEndOfWord){
//         // for (i = 0; i < size; i++){
//         printf("%s\n", prefix);
//         // }
//         // printf("\n");
//     }

//     int current = strlen(prefix);

//     for (i = 0; i < ALPHABET_SIZE; i++){
//         TrieNode *child = currentRoot -> children[i];
        
//         if (child != NULL){

//             prefix[current] = '\0';
//             strcat(prefix, child -> label); // insert the current nodes label to the prefix
//             // printf("%s\n", prefix);
//             traverse(prefix, child); // traverse the rest of the tree

//         }
//     }
    
// }