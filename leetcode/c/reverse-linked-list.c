
#include <stdlib.h>

//Definition for singly-linked list.
 struct ListNode {
     int val;
     struct ListNode *next;
};

// https://leetcode-cn.com/problems/reverse-linked-list/

static struct ListNode* reverseList(struct ListNode* head){

    struct ListNode* tail = NULL;
    struct ListNode* cursor = head;

    while(cursor) {
        head = cursor->next;
        cursor->next = tail;
        tail = cursor;
        cursor = head;
    }
    return tail;
}
