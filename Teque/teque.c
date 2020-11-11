//
//  main.c
//  Teque
//
//  Created by Andreas Wachs Hjalager on 17/10/2020.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

struct node{
    struct node* prev;
    unsigned long value;
    struct node* next;
};

void scan_line(int* action, unsigned long* value);
int seek_space(char s[]);
void get_action(char s[], int* action);
void get_val(char s[], unsigned long* value);
void push_back(struct node* n);
void push_front(struct node* n);
void push_middle(struct node* n);
unsigned long get(unsigned long index);
void traverse_nodes(void);
void traverse_from(struct node* START);
void free_all(struct node* START);

struct node* HEAD;
struct node* MIDDLE;
struct node* TAIL;
int size;
int N;


int main(int argc, const char * argv[]) {
    // Firstly scan inputs for the first line
    N = 0; // Number of commands from the test
    size = 0; // size of the teque
    
    // Lazy read and error handling...
    if (!scanf("%i", &N))
        return -1;
    
    // Placeholders for the ID for which actions is going to be taken, and the precise value of the input.
    int action = 0;
    unsigned long value = 0;
    
    // Start by declaring a start node. This is for allocating the first 3 nodes.
    struct node* START;
    
    // Declare the interator number i outside of the loop, cause we're gonna go use 2 for loops, in 2 parts.
    // The reason for this is to spare the number of times the program as to do checks, wasting CPU cycles, since this following
    // block of code only needs to run through until the length of the deque is 3, then we have a cleaner way of inserting elements.
    // This is of course costing some points for style, but fuck that -- it works.
    int i = 0;

    // Go throgh this loop, making sure that by the end there is 3 nodes in the teque
    for (i = -1; size < 3; i++) {
        scan_line(&action, &value);
        
        struct node* buffer = (struct node*) malloc(sizeof(struct node));
        buffer->next = NULL;
        buffer->prev = NULL;
        buffer->value = value;
        
        if (i > -1) { // We ignore the first iteration because it seems to cause some problems - the first iteration doesn't have any value
            if (action > 0) {
                if (size == 0) {
                    START = buffer;
                } else if (size == 1) {
                    if (action == 1 || action == 3) {
                        START->next = buffer;
                        buffer->prev = START;
                    } else if (action == 2) {
                        buffer->next = START;
                        START->prev = buffer;
                        START = buffer;
                    }
                } else if (size == 2) {
                    if (action == 1) {
                        START->next->next = buffer;
                        buffer->prev = START->next;
                    } else if (action == 2) {
                        buffer->next = START;
                        START->prev = buffer;
                        START = buffer;
                    } else if (action == 3) {
                        buffer->next = START->next;
                        buffer->prev = START;
                        
                        START->next->prev = buffer;
                        START->next = buffer;
                    }
                }
                size++;
            } else {
                if (size == 1 || value == 0) {
                    printf("%lu\n", START->value);
                } else if (size == 2) {
                    printf("%lu\n", START->next->value);
                    
                } else if (size == 3) {
                    if (value == 1)
                        printf("%lu\n", START->next->value);
                    else
                        printf("%lu\n", START->next->next->value);
                }
            }
        }
        
    }
    
    // With the 3 nodes in the teque, we can assign each a special place, with a "shortcut" of a special variable..
    HEAD = START;
    MIDDLE = START->next;
    TAIL = START->next->next;
    
    // Go through the rest of the commands and react to what the test wants to be done.
    for (;i <= N; i++) {
        // Scan the line, get the values
        scan_line(&action, &value);
        if (action == -1) break;
            // We're pushing a number somewhere
        if (action > 0) {
            struct node* buffer = (struct node*) malloc(sizeof(struct node));
            buffer->next = NULL;
            buffer->prev = NULL;
            buffer->value = value;
            
            if (action == 1)
                push_back(buffer);
            else if (action == 2)
                push_front(buffer);
            else if (action == 3)
                push_middle(buffer);
        } else {
            // We're getting a number from the list
            printf("%lu\n", get(value));
        }
        
    }
    
    free_all(HEAD);
    return 0;
}


unsigned long get(unsigned long index) {
    if (index >= size)
        return 0;
    
    // index is 0-indexed adjusted
    int dist_head = index;
    int dist_tail = size - index;
    int count = 0;
    
    if (dist_head <= dist_tail) {
        // loop from the beginning
        struct node* buffer;
        buffer = HEAD;
        while(buffer != NULL) {
            if (count == index)
                return buffer->value;
            buffer = buffer->next;
            count++;
        }
    } else {
        count = size - 1;
        // backwards loop
        struct node* buffer;
        buffer = TAIL;
        while(buffer != NULL) {
            if (count == index)
                return buffer->value;
            buffer = buffer->prev;
            count--;
        }
    }
    return 0;
}

void push_back(struct node* n) {
    size++;
    TAIL->next = n;
    n->prev = TAIL;
    TAIL = n;
    
    // Move the middle to the left one place
    if (size % 2 == 1)
        MIDDLE = MIDDLE->next;

}

void push_front(struct node* n) {
    size++;
    n->next = HEAD;
    HEAD->prev = n;
    HEAD = n;
    
    // move middle one to the right
    if (size % 2 == 1)
        MIDDLE = MIDDLE->prev;
    
}

void push_middle(struct node* n) {
    size++;
    n->next = MIDDLE->next;
    MIDDLE->next->prev = n;
    
    MIDDLE->next = n;
    n->prev = MIDDLE;
    
    if (size % 2 == 1)
        MIDDLE = n;
}

void scan_line(int* action, unsigned long* value) {
    // Now we're going to scan each line and process it
    char buffer[128];
    
    // Start scanning character by character
    if (fgets(buffer, sizeof(buffer), stdin) != NULL) {
        get_action(buffer, action);
        get_val(buffer, value);
    } else {
        *action = -1;
    }
}

void get_val(char s[], unsigned long* value) {
    int s_loc = seek_space(s);
    int newlen = (int) strlen(s) - s_loc;
    char buffer[newlen];
    for(int i = 0; i < newlen; i++) {
        buffer[i] = s[i + s_loc];
    }
    char* nptr;
    *value = strtol(buffer, &nptr, 10);
}

void get_action(char s[], int* action) {
    if (s[0] == 'g') {
        *action = 0;
    } else {
        if (s[5] == 'b')
            // push_back = 1
            *action =  1;
        else if (s[5] == 'f')
            // push_front = 2
            *action = 2;
        else
            // push_middle = 3
            *action = 3;
    }
}

int seek_space(char s[]) {
    int len = (int) strlen(s);
    for (int i = 0; i < len; i++) {
        if (s[i] == 32)
            return i;
    }
    return -1;
}

void free_all(struct node* START) {
    if (START->next == NULL)
        free(START);
    else
        free_all(START->next);
}

// These two following functions are for use in development.
void traverse_nodes() {
    int count = 0;
    if (HEAD != NULL) {
        for (struct node* buffer = HEAD; buffer != NULL; buffer = buffer->next) {
            printf("node[%d] = %lu\n", count, buffer->value);
            count++;
            if (count > 10)
                break;
        }
    } else {
        printf("There are no nodes to traverse.\n");
    }
    
}

void traverse_from(struct node* START) {
    int count = 0;
    if (START != NULL) {
        for (struct node* buffer = START; buffer != NULL && count <= size; buffer = buffer->next) {
            printf("node[%d] = %lu\n", count, buffer->value);
            count++;
        }
    } else {
        printf("There are no nodes to traverse.\n");
    }
}
