
// https://leetcode-cn.com/problems/reverse-nodes-in-k-group/

#include <stdlib.h>

// Definition for singly-linked list.
struct ListNode {
      int val;
      struct ListNode *next;
 };


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

//翻转链表前k个节点。注意：链表被翻转，head指向已改变。
struct ListNode* reverseList(struct ListNode* head, struct ListNode **tail, int k) {
    struct ListNode *prev = NULL, *cursor = head, *temp;
    while(k-- && cursor) {
        temp = cursor->next;
        cursor->next = prev;
        prev = cursor;
        cursor = temp;
    }

    *tail = head;
    return prev;
}

struct ListNode* reverseKGroup(struct ListNode* head, int k){
    struct ListNode *cursor = head, *newHead = NULL, *temp, *groupHead, *nextHead = NULL, *tail = NULL, *prevTail;
    int length = lengthOfList(head);
    int reverseCount = length / k;
    while(reverseCount--) {
        groupHead = cursor; // 待翻转组节点【注意：groupHead后面会被改变】
        nextHead = cursor; // 下一段待翻转节点【哨兵】

        int count = k;
        while(count-- && nextHead) {
            nextHead = nextHead->next;  
        }

        prevTail = tail; // prevTail保存当前已翻转好链表的尾节点
        temp = reverseList(groupHead, &tail, k);

        if(!newHead) {
            newHead = temp;
        } else {
            prevTail->next = temp; // 拼接当前翻转的组节点
        }
        cursor = nextHead;
    }

    tail->next = nextHead; // 链接末尾剩余不用翻转的节点

    return newHead;
}
