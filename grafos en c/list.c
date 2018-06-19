#include <stdio.h>
#include <stdlib.h>
#include "list.h"

struct list *new_list(){
    struct list *initial;
    initial = malloc(sizeof(struct list));
    initial -> size = 0;
    return initial;
}


struct list *find(int index, struct list *initial){
    struct list *next = new_list();
    int counter = 0;
    next = initial;
    while ( next != NULL ) {
        if(index == counter){
            return next;
        }
        next = next->next;
        counter += 1;
    }
}

void append(struct list *initial, struct list *next)
{
    initial -> size += 1;
    next = initial;
    if (next != 0)
    {
        while(next -> next !=0)
        {
            next = next -> next;
        }
    }
    next -> next = malloc(sizeof(struct list));
    next = next -> next;
}

void pop(struct list *initial, struct list *remove)
{
    struct list *next = initial;
    if (next != 0)
    {
        while(next -> next !=0)
        {
            if(next == remove)
            {
                free(next);
                break;
            }
            next = next -> next;
        }
    }
    
}
void delete_list(struct list *initial)
{
    free(initial);
}
