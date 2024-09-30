// a.
struct _coord {
    double x;		// offset = 0
    double y;		// offset = 8
};					// size = 16

// b.
typedef struct _node Node;
struct _node {
    int value;		// NODE_VALUE_OFFSET = 0
    Node *next;		// NODE_NEXT_OFFSET = 4
};					// size = 8 

// c.
struct _enrolment {
    int stu_id;         // e.g. 5012345		OFFSET = 0
    char course[9]:     // e.g. "COMP1521"  OFFSET = 4
    char term[5];       // e.g. "17s2"      OFFSET = 13
    char grade[3];      // e.g. "HD"        OFFSET = 18
    double mark;        // e.g. 87.3		not 21, actually 24
						// size = 32
};

//d.
struct _queue {
    int nitems;     // # items currently in queue
    int head;       // index of oldest item added
    int tail;       // index of most recent item added
    int maxitems;   // size of array
    Item *items;    // malloc'd array of Items
};
