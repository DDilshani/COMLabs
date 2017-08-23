int fileRead(char * filePath, char * content){
	// This function read the file and put it into the content array 

	FILE *fp = fopen(filePath, "r");
	if (fp != NULL) {
	    size_t newLen = fread(content, sizeof(char), 1000, fp);
	    if ( ferror( fp ) != 0 ) {
	        fputs("Error reading file", stderr);
	    } else {
	        content[newLen++] = '\0'; 
	    }

    	fclose(fp);
	}
	return (int)strlen(content);
}