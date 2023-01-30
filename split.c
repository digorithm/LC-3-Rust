#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

int main(int argc, char *argv[]) {
    char *path = argv[1];

    FILE *fp = NULL;
    FILE *source = fopen(path, "r");
    char *line = NULL;
    size_t len = 0;
    ssize_t read;

    int fileCount = 0;
    
    int lineNr = 0;

    while ((read = getline(&line, &len, source)) != -1) {
        // if line contains .ORIG, create a new file with the name fileCount.asm
        char *linelower = malloc(sizeof(char) * strlen(line));
        for (int i = 0; i < strlen(line); i++) {
            linelower[i] = tolower(line[i]);
        }

        if (strstr(linelower, ".orig") != NULL) {
            char *fileName = malloc(1000);
            sprintf(fileName, "noonewouldcomeupwiththisname%d.asm", fileCount);
            fp = fopen(fileName, "w");
            fileCount++;
        }
        // write the line to the file
        if (fp != NULL)
            fprintf(fp, "%s", line);

        // if line contains .END, close the file
        if (strstr(linelower, ".end") != NULL) {
            fclose(fp);
            fp = NULL;
        }

    }
    if (source)
        fclose(source);

}