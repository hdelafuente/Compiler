#ifndef MEM_H
#define MEM_H
#include <string.h>
/* Series of functions used to add memory store functionality to the calculator */

// Store variable names
char* var_names[100];

// Flags for if the variables have been set
int var_set[100];

// Number of variables defined
int var_counter = 0;

// Store values of the variables
double var_values[100];

/* Add a variable name to the memory store */
int add_var(char* var_name)
{
    int x; // Index var
    
    /* Search for the variable and return its index if found */
    for (x = 0; x<var_counter; x++) {
        if (strcmp(var_name, var_names[x]) == 0) {
            return x;
        }
    }
    
    /* Variable not found yet. */
    /* Define it and add it to the end of the array. */
    var_counter++;
    var_names[x] = strdup(var_name);
    return x;
}

/* Set a variables value in the memory store */
int set_var(int index, double val)
{
    var_values[index] = val;
    var_set[index] = 1;
    
    return val;
}

#endif
