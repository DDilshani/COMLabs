#include "AutoCompleteImpl.h"

TrieNode *createTrieNode() {
	// create new node 
    TrieNode * newNode = (TrieNode*) malloc(sizeof(TrieNode));
    // define and give space for childen in heap
    newNode->children = (TrieNode**) malloc(sizeof(TrieNode*));
    newNode->label=NULL;
    newNode->isEndOfWord  = false;
    newNode->numChildren = 0;

	return newNode;
}

void insert(TrieNode *root, char *word) {

	/*Algorithm for the inserting a node :

	 ** get the begining of the root
	 ** get all childen of the root and compair with word
	 ** if match all characters of the node exit 
	 ** else keep matching charactes and if not found relevant characters of the word create a noed woih that characters
	 ** if match occur and there are some diffrent charactors characters, create new node with that characters and
	    assign all the nodes belongs to that node as childen of that
	 ** then create new node with rest of the characters of the word as a new child of that node
	 ** finally give the endOfWord as true( that is the end of the word that inserting)

	 */

    if(root == NULL) 
    	return;

    TrieNode * current = root;
    
    while(true){ // keep finding

        bool isChild = false;

        for(int i = 0; i < current->numChildren; i++){

        	// get the each child by 
            TrieNode * temp = current->children[i];
            int prefix = getNextPrefix(temp->label, word);
            
            if(prefix > 0){
            	// check the node
                if(prefix == strlen(temp->label)){ // jump to the next node and keep ckecking                 
                    // asume that the dictinary have no same word again
                    // if prefix length get equals to lenght of the lablee of the node we have to get next nodes(chidren of this node)
                    // keep checking these childen nodes

                    current = temp;
                    word = getNextWord(word, strlen(word) - prefix, prefix);
                    isChild = true;
                    break;
                }
                else{

                	// if there are diffrent characters we have to modify this temp node and create child with that other diffrent characters
                    TrieNode * child = createTrieNode();
                    // make a node with that rest characters and assign othe childens that belongs to temp to this node
                    child->label = getNextWord(temp->label, strlen(temp->label) - prefix, prefix);
                    child->children = malloc(sizeof(TrieNode*)*temp->numChildren);
                    memcpy(child->children, temp->children, sizeof(TrieNode*)*temp->numChildren); // copy all childen of temp and assign to this node's children

                    child->numChildren = temp->numChildren;
                    // re buiding the temp node with new lable
                    temp->label = getNextWord(temp->label,prefix,0);
                    temp->numChildren = 0; // initially no any children 
                    temp->children = (TrieNode**) malloc(sizeof(TrieNode*));
                    temp->isEndOfWord = false;

                    //addChild(temp, child);
                    // add child to the temp node                   
    				temp->children = (TrieNode**)realloc(temp->children,sizeof(TrieNode*));
    				temp->children[0] = child;
    				temp->numChildren ++;
		    		
		    		// create new node to store rest of the chatacters of the word
		        	TrieNode * newKid = createTrieNode();
    		    	newKid->label = getNextWord(word, strlen(word) - prefix, prefix);
    		    	newKid->isEndOfWord = true;
    
                    // add that node to the temp also
                    //addChild(temp, node);
    				temp->children = (TrieNode**)realloc(temp->children, (2)* sizeof(TrieNode*));
    				temp->children[1] = newKid;
    				temp->numChildren ++;

                    return;
                }
            }
        }
        if(!isChild){ // if not create a node
            TrieNode * node1 = createTrieNode();
    	    node1->label = word;
            node1->isEndOfWord = true;
    		/* created node must be added to the root node in does not exist to do that we can use the 
    			realloc inbuild function in C. this will add next pointer to the child node considering 
    			the previous child address.
    		*/   
            int k = current->numChildren;
    		current->children = (TrieNode**)realloc(current->children, (k + 1)* sizeof(TrieNode*));
    		// add created node to ponted address
    		current->children[k] = node1;
    		// increase the number of children
    		current->numChildren = k + 1;
            return;
        }    
    }
    
    
}

TrieNode *search(TrieNode *root, char *word, char * nodeWord) {

	/* Algorithm for serching :
	 ** check the character length and it is greater thatn zero continue to end of the word
	 ** compare each node labe with the node. if lable is similar to the word return that node
	 ** else continue with each child node with rest of the characters while storing similar 
	    characters to another pointer.
	 ** this process can be done until the word found
	 ** if not, return node as null
	 */

    if(root == NULL) 
    	return NULL;

    TrieNode * current = root;


    while(strlen(word) > 0){ // keep running until whole finish all the characters serching
        bool isChild = false;

        for(int j = 0; j < current->numChildren; j++){

            TrieNode * temp = current->children[j];
            // get number of maching characters
            int prefix = getNextPrefix(temp->label, word);

            if(prefix > 0){
                if(prefix == strlen(word)){
                    return temp; // if the word maching return the maching node
                }
                else{
                    current = temp;
                    // strcat can concatenate the two string(add two string togather) set all maching characters togather
                    strcat(nodeWord, getNextWord(word,prefix,0));
                    // get the next word with rest of the characters of the word
                    word = getNextWord(word,strlen(word) - prefix,prefix);
                    isChild = true;
                    break;
                }
            }
        }
        if(!isChild) // if there are no any maching label return a null node 
        	return NULL;
    }

    return current; // returnning the current node
}


void traverse(char *prefix, TrieNode *finalNode) {

 	int length =strlen(prefix);
 	//prefix[length] =  '\0';

 	if(finalNode == NULL)  // if the final node there are no any matching nodes
    	return;

 	if(finalNode->isEndOfWord){ // checking the endof the word
        printf(" * %s\n", prefix);
       
    }
 	
    /*if(finalNode == NULL)  
    	return;*/

    for(int j = 0; j < finalNode->numChildren; j++){
    	
    	prefix[length] =  '\0';  // give the end of the word otherwise it will imposible to concatanate strings
        TrieNode * temp = finalNode->children[j];
        strcat(prefix, temp->label);
        // traverse recusively
        traverse(prefix, temp);
    }
}


// get the matching number of characters 
int getNextPrefix(char * word1, char * word2){
	int w1,w2,k;
	int prefix_counter=0;


    w1 = strlen(word1);
    w2 = strlen(word2);

    if(w2>w1)
    	k=w1;
    else
    	k=w2;

    for(int i = 0;i < k;i++){

        if(word1[i] == word2[i])
        	prefix_counter++;
        else 
        	break;
    } 
    return prefix_counter;
}


char * getNextWord(char * currentword,int diff,int index){
    
    char* nextWord = (char*) malloc(diff + 1);
    memcpy(nextWord, &currentword[index], diff);
    nextWord[diff] = '\0'; // end of the word

    return nextWord;
}

