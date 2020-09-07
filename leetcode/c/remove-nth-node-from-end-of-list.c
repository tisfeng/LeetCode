
// https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/

#include <stdlib.h>
#include <stdio.h>

// Definition for singly-linked list.
struct ListNode {
      int val;
      struct ListNode *next;
 };

// void printListNode(struct ListNode *head) {
//     printf("\nlist: ");
//     struct ListNode *cursor = head;
//     while(cursor) {
//         printf("%d, ", cursor->val);
//         cursor = cursor->next;
//     }
//     printf("\n");
// }

//void printArray(int *array, int length) {
//    printf("\narray: ");
//    for(int i = 0; i < length; i++) {
//        printf("%d, ", *(array+i));
//    }
//    printf("\n");
//}

//static int *arrayFromList(struct ListNode *head, int *array, int length) {
//    struct ListNode *cursor = head;
//    for(int i = 0; i < length; i++) {
//        array[i] = cursor->val;
//        cursor = cursor->next;
//    }
//    return array;
//}
//
//static struct ListNode *listFromArray(int *array, int length) {
//    struct ListNode *head = NULL, *tail = NULL;
//
//    for(int i = 0; i < length; i++) {
//        struct ListNode *newNode = (struct ListNode *)malloc(sizeof(struct ListNode));
//        newNode->val = array[i];
//        newNode->next = NULL;
//        if (i == 0) {
//            head = newNode;
//            tail = head;
//            continue;
//        }
//        tail->next = newNode;
//        tail = newNode;
//    }
//
//    return head;
//}

// 删除数组元素 a[deleteIndex]
int *arrayDeleteElement(int *array, int length, int deleteIndex) {
    if (deleteIndex < 0 || deleteIndex >= length) {
        printf("delete index error: %d", deleteIndex);
        return array;
    }
    // printf("\ndelete array[%d]=%d\n", deleteIndex, array[deleteIndex]);
    
    if(deleteIndex == length - 1) {
        array[deleteIndex] = '\0';
        return array;
    }

    for(int i = deleteIndex; i < length - 1; i++) {
        *(array + i) = *(array + i + 1);
    }

    return array;
}

/**
# 3.链表转数组法
思路：
1.遍历获取链表长度length；
2.用数组array保存链表节点值；
3.删除数组a[length-n]元素；
4.将数组转回链表；
*/
// struct ListNode* removeNthFromEnd(struct ListNode* head, int n){
//     struct ListNode *cursor = head;
//     int length = 0;
//     while(cursor) {
//         length++;
//         cursor = cursor->next;
//     }
//     int arr[length];
//     int *array = arrayFromList(head, arr, length);
//     int *newArray = arrayDeleteElement(array, length, length - n);

//     return listFromArray(newArray, length - 1);
// }

/**
双指针间隔法
思路：
1.定义两个指针`cursor`、`prev`；
2.`cursor`指针先行，用于遍历链表；
3.`prev`与`cursor`的间隔为`n`；
4.当`cursor`为空时，此刻`prev`指向链表倒数第`n`个节点的前一个节点；
5.删除`prev`的下一个节点。
*/
struct ListNode* removeNthFromEnd(struct ListNode* head, int n) {
    struct ListNode *prev = head, *cursor = head;
    while(cursor) {
        cursor = cursor->next;
        if (n-- < 0) {
            prev = prev->next;
        }
    }
    if (n == 0) { // 若删除的是头节点
        return head->next;
    }
    prev->next = prev->next->next;
    return head;
}



// struct ListNode* removeNthFromEnd(struct ListNode* head, int n){
//     struct ListNode *p = head, *q = head;
//     while(p) {
//         if(n < 0){ 
//             q = q -> next; 
//         }       
//         n--;
//         p = p -> next;
//     }
//     if(n == 0) { 
//         return head -> next; 
//     }
//     q -> next = q -> next -> next;
//     return head;
// }

// struct ListNode* removeNthFromEnd(struct ListNode* head, int n){
//     struct ListNode *cursor = head;
//     int length = 0;
//     struct ListNode *prev = head, *recent = head;
//     while(cursor) {
//         length++;
//         if (length % n == 0) {
//             prev = recent;
//             recent = cursor;
//             printf("---prev: %d, recent: %d, len=%d\n",prev->val,recent->val,length);
//             int k = n; // 寻找目标前一个节点
//             while(cursor && k) { // 探查当前节点，其后n个节点是否为空  
//                 printf("cursor: %d, k=%d,\n", cursor->val,k);
//                 cursor = cursor->next;
//                 k--; 
//             }
//             printf("//cursor: %d, k=%d\n", cursor->val,k);
//             if (cursor && !k) { // 还未找到尾节点，继续遍历
//                 length += n;
//                 printf("---continue, %d, k=%d, len=%d\n", cursor->val,k,length);
//                 continue;
//             }
//             if (!k && !cursor) { // 
//                 printf("break: k=%d, recent: %d, cursor=%d\n", k,recent->val, cursor->val);
//                 recent->next = recent->next->next;
//                 break;
//             } else { // !cursor
//                 printf("--else: k=%d, recent: %d, cursor=%d\n", k,recent->val, cursor->val);
//                 while(!recent && k--) {
//                     recent = recent->next;
//                     printf("---recent: %d, k=%d\n", recent->val, k);
//                 }
//                 printf("===k=%d, prev: %d, recent: %d\n", k,prev->val, recent->val);
//                 while(--k > 0) {
//                     cursor = prev->next;
//                     printf("+++prev: %d, k=%d\n", cursor->val, k);
//                 }
//                 cursor->next = cursor->next->next;
//                 printf("break2: len=%d, k=%d, recent: %d, cursor=%d\n", length,k,recent->val, cursor->val);
//                 break;
//             }
//         } 
//         else {
//             printf("---outside cursor: %d, len=%d\n", cursor->val, length);
//             cursor = cursor->next; 
//         }
        
//     }

//     return head;
// }

// 删除链表第n个节点
struct ListNode* deleteNode(struct ListNode *head, int n) {
    struct ListNode *cursor = head;
    struct ListNode *prev = head;
    
    if (!cursor->next && n == 1) { // 若链表中只有一个元素 [3]->[]
        return NULL;
    }  else if (n == 1) { // 若删除链表中第一个元素 [1,2]->[2]
        return head->next;
    }

    while(cursor && --n) { // 防止越界
        prev = cursor;
        cursor = cursor->next;
    }
    if (!cursor) {
        printf("delete index error!");
        return NULL;
    }
    prev->next = cursor->next;

    return head;
}


/**
# 1.获取链表长度法
思路：
1.遍历获取链表长度length；
2.遍历，删除链表倒数第n个节点，即删除第（length - n + 1）个节点；
*/
// struct ListNode* removeNthFromEnd(struct ListNode* head, int n){
//     struct ListNode *cursor = head;
//     int length = 0;
//     while(cursor) {
//         length++;
//         cursor = cursor->next;
//     }
//     int deleteIndex = length - n + 1;
//     return deleteNode(head, deleteIndex);
// }

/**
# 1.2 获取链表长度法（优化）
思路：在原基础上，使用数组pNode[]保存所有节点的指针，这样就能直接删除第（length - n）个节点而不用再次去遍历链表了。以空间换时间。
*/
// struct ListNode* removeNthFromEnd(struct ListNode* head, int n){
//     struct ListNode *cursor = head;
//     int length = 0;
//     struct ListNode *pNode[10000]; // 以空间换时间🤣

//     while(cursor) {
//         pNode[length++] = cursor;
//         cursor = cursor->next;
//     }
    
//     if (n == length) { // 删除头节点 
//         return head->next;
//     }  

//     struct ListNode *prev = pNode[length - n -1];
//     prev->next = prev->next->next;

//     return head;
// }

/**
# 2.链表翻转法
思路：
1.将链表进行翻转；
2.遍历链表，删除第n个节点；
3.将链表再次翻转回来。
*/

// 翻转链表
// static struct ListNode* reverseList(struct ListNode *head) {
//     struct ListNode *tail = NULL;
//     struct ListNode *cursor = head;
//     while(cursor) {
//         head = cursor->next;
//         cursor->next = tail;
//         tail = cursor;
//         cursor = head;
//     }
//     return tail;
// }
 
// struct ListNode* removeNthFromEnd(struct ListNode* head, int n){
//     struct ListNode *reverseHead = reverseList(head);
//     reverseHead = deleteNode(reverseHead, n);

//     return reverseList(reverseHead);
// }
