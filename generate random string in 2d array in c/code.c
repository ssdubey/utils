#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
char keys[1000][1000];
char values[1000][1000];
char *string = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
char tempchar[11];

int n = 0;
int i =0;

for (n=0;n<100;n++){
for (i =0; i<10;i++){
int key = rand() % 62;
tempchar[i]=string[key];
}
tempchar[i]='\0';
strcpy(keys[n], tempchar);
//printf("%s\n", keys[n]);
}

char tempcharval[51];
for (n=0;n<100;n++){
for (i =0; i<50;i++){
int key = rand() % 62;
tempcharval[i]=string[key];
}
tempcharval[i]='\0';
strcpy(values[n], tempcharval);
//printf("%s\n", values[n]);
}

for(int i=0; i<100; i++){
printf("%s   %s\n", keys[i],values[i]);
}
}
