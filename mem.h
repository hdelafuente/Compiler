#ifndef MEM_H
#define MEM_H
#include <string.h>
/* Series of functions used to add memory store functionality to the calculator */

// Store variable names
char* var_names[100];

// Flags for if the variables have been set
int var_set[100];

// Number of variables defined
int var_counter;

int line_num;
// Store values of the variables
double var_values[100];

/* Add a variable name to the memory store */
int add_var(char* var_name);

/* Set a variables value in the memory store */
int set_var(int index, double val);

#endif
