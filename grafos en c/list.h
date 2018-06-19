
struct list
{
    int size;
    struct list *next;
};
struct list *new_list();
struct list *find(int index, struct list *initial);
void append(struct list *initial, struct list *next);
void pop(struct list *initial, struct list *remove);
void delete_list(struct list *initial);
