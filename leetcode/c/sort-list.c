
// https://leetcode-cn.com/problems/sort-list/

#include <stdlib.h>

#define bool int

// Definition for singly-linked list.
struct ListNode {
      int val;
      struct ListNode *next;
 };

// 打印链表
//void printList(struct ListNode *head) {
//     printf("\nprint list: ");
//     struct ListNode *cursor = head;
//     while(cursor) {
//         printf("%d, ", cursor->val);
//         cursor = cursor->next;
//     }
// }

// 获取链表长度
static int lengthOfList(struct ListNode *head) {
     int length = 0;
     struct ListNode *cursor = head;
     while(cursor) {
         length++;
         cursor = cursor->next;
     }
     return length;
 }

// 合并两个有序链表。 直接插入，在一个有序链表上，插入另一个有序链表
struct ListNode* mergeList(struct ListNode* l1, struct ListNode* l2) {
    // printf("\n--- ready merge: ");
    // printList(l1);
    // printList(l2);
    if(!l1) {
        return l2;
    }
    if (!l2) {
        return l1;
    }

    struct ListNode *cursor1 = l1;
    struct ListNode *cursor2 = l2;
    struct ListNode *head = l1;
    int value1 = cursor1->val;
    int value2 = cursor2->val;

    if(value1 > value2) {
        cursor1 = l2; // cursor1 始终指向较小链表
        cursor2 = l1;
        head = l2;
    }

    struct ListNode *prev = l1, *temp;
    while(cursor1 && cursor2) {
        int value1 = cursor1->val;
        int value2 = cursor2->val;  
        if(value1 < value2) {
            prev = cursor1;
            cursor1 = cursor1->next; //遍历l1，插入l2的节点
        } else {
            temp = cursor2->next;
            cursor2->next = prev->next;
            prev->next = cursor2;
            cursor1 = prev->next;
            cursor2 = temp;  
        }
    }
    if(cursor2) {
        prev->next = cursor2;
    }
    // printf("\n---- merged list: ");
    // printList(head);
    return head;
}

static struct ListNode *merge_sort(struct ListNode *head) {
    if(!head) {
        return NULL;
    }
    int length = lengthOfList(head);
    // printf("\n---merge_sort, len=%d ", length);
    // printList(head);
    
    int l_size = length / 2;
    struct ListNode *left = head;
    struct ListNode *cursor = head;
    struct ListNode *right;
    while(l_size--) {
        right = cursor;
        cursor = cursor->next;
    }
    right->next = NULL;
    right = cursor;
    // printf("\n left=%d, right=%d  ", left->val, right->val);
    if(length > 1) {
        left = merge_sort(left);
        right = merge_sort(right);
        head = mergeList(left, right);
    }

    return head;
}

struct ListNode* sortList(struct ListNode* head) {

    return merge_sort(head);
}

struct ListNode* bubble_sortList(struct ListNode* head){
    int length = lengthOfList(head);
    bool isSorted;
    for(int i = 0; i < length - 1; i++) {
        struct ListNode *cursor = head;
        isSorted = 0;
        for(int j = 0; j < length - i - 1 ; j++) {
            struct ListNode *next = cursor->next;
            if(cursor->val > next->val) { //交换节点的值
                int temp = cursor->val;
                cursor->val = next->val;
                next->val = temp;
                isSorted = 1;
            }
            cursor = cursor->next;
        }
        if(!isSorted) {
            break;
        }
    }
    return head;
}
