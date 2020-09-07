// https://leetcode-cn.com/problems/merge-two-sorted-lists/

#include <stdlib.h>
#include <stdio.h>

#define bool int

// Definition for singly-linked list.
struct ListNode {
      int val;
      struct ListNode *next;
 };


// 打印数组
void printArray(int *array, int length) {
    printf("\nprint array: ");
    for(int i = 0; i < length; i++) {
        printf("%d, ", *(array+i));
    }
}

// 打印链表
void printListNode(struct ListNode *head) {
     printf("\nprint list: ");
     struct ListNode *cursor = head;
     while(cursor) {
         printf("%d, ", cursor->val);
         cursor = cursor->next;
     }
 }

// 获取链表长度
 int lengthOfList(struct ListNode *head) {
     int length = 0;
     struct ListNode *cursor = head;
     while(cursor) {
         length++;
         cursor = cursor->next;
     }
     return length;
 }

//链表转数组
void arrayFromList(struct ListNode *head, int *array, int length) {
    struct ListNode *cursor = head;
    for(int i = 0; i < length; i++) {
        array[i] = cursor->val;
        cursor = cursor->next;
    }
}

//创建链表（数组转链表）
struct ListNode *listFromArray(int *array, int length) {
    struct ListNode *head = NULL, *tail = NULL;
    for(int i = 0; i < length; i++) {
        struct ListNode *node = (struct ListNode *)malloc(sizeof(struct ListNode));
        node->val = array[i];
        node->next = NULL;
        if (i == 0) {
            head = node;
            tail = head;
            continue;
        }
        tail->next = node;
        tail = node;
    }
    return head;
}
// 合并两个数组
void joinTwoArray(int *arr, int length, int *arr2, int length2, int *newArray) {
    for(int i = 0; i < length; i++) {
        newArray[i] = arr[i];
    }
    for(int i = 0; i < length2; i++) {
        newArray[length+i] = arr2[i];
    }
}

// 交互两个变量值（传指针）
void swap(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

// 选择排序 [2,1,3,5,4]-->[1,2,3,4,5]
void selectSortedArray(int *arr, int length) {
    int minIndex;
    for(int i = 0; i < length - 1; i++) {
        minIndex = i;
        for(int j = i + 1; j < length; j++) {
            if (arr[j] < arr[minIndex]) {
                minIndex = j;
            }
        }
        if (minIndex != i) {
            swap(&arr[minIndex], &arr[i]);
        }
    }
}
// 冒泡排序 [2,1,3,5,4]-->[1,2,3,4,5]
void bubbleSortedArray(int *arr, int length) {
    bool isChanged;
    for(int i = 0; i < length - 1; i++) {
        isChanged = 0;
        for(int j = 0; j < length - i - 1; j++) {
            if (arr[j] > arr[j+1]) {
                swap(&arr[j], &arr[j+1]);
                isChanged = 1;
            }
        }
        if (!isChanged) {
            break;
        }
    }
}
// 插入排序 [2,1,3,5,4]-->[1,2,3,4,5]
void insertSelectSortedArray(int *arr, int length) {
    for(int i = 1; i < length; i++) {
        for(int j = 0; j < i; j++) {
            if (arr[i] < arr[j]) {
                swap(&arr[i], &arr[j]);
            }
        }
    }
}
// 插入排序
void insertSortedArray2(int *arr, int length) {
    for(int i = 1; i < length; i++) { //插入第i个数，然后排序
        int insertValue = arr[i];
        if (insertValue > arr[i-1]) { //若待插入值最大，已排好序。
            continue;
        }

        int insertIndex = -1; 
        for(int j = 0; j < i; j++) {
            if (insertValue < arr[j]) {
                insertIndex = j;
                break;
            }
        }
        if (insertIndex != -1) {
            for(int k = i; k > insertIndex; k--) {
                arr[k] = arr[k-1];
            }
            arr[insertIndex] = insertValue;
        }
    }
}

void insertSortedArray3(int arr[], int len) {
    int i, j, insertValue;
    for (i = 1; i < len; i++){
        insertValue = arr[i];
        j = i - 1;
        while((j >= 0) && (insertValue < arr[j])) {
            arr[j+1] = arr[j]; //冒泡交换，前移
            j--;
        }
        arr[j+1] = insertValue;
    }
}

void insert_sort(int arr[], int len, int start_index, int step) {
    int i, j, insertValue;
    for (i = start_index + step; i < len; i += step) {
        insertValue = arr[i];
        j = i - step;
        while((j >= 0) && (insertValue < arr[j])) {
            arr[j+step] = arr[j]; //冒泡交换，前移
            j -= step;
        }
        arr[j+step] = insertValue;
    }
}
// 希尔排序
void shell_sort(int arr[], int len) {
    int step = len / 2;
    while(step > 0) {
        for(int i = 0; i < step; i++) {
            insert_sort(arr, len, i, step);
        }
        // printArray(arr, len); printf("\n");
        step /= 2;
    }
}

void quick_sort(int arr[], int left, int right) {
    int i = left;
    int j = right;
    int pivot = arr[left];
    if (left < right) {
        while(i < j) {
            while(i < j && arr[j] >= pivot) {
                j--;
            }
            while(i < j && arr[i] <= pivot) {
                i++;
            }
            if (i < j) {
                swap(&arr[i], &arr[j]);
            }
        }
        
        arr[left] = arr[i];
        arr[i] = pivot;
        
        // printArray(arr, 6); printf("\n");

        quick_sort(arr, left, i - 1);
        quick_sort(arr, i + 1, right);
    }   
}

// void quick_sort(int arr[], int left, int right) {
//     if (left < right) {
//         int i = left;
//         int j = right;
//         int pivot = arr[left]; // 取左边第一个为【基准】点
//         while (i < j) {
//             // 从右向左找第一个小于pivot的数
//             while(i < j && arr[j] >= pivot) {
//                 j--;
//             }
//             if(i < j) {
//                 arr[i++] = arr[j];
//             }
            
//             // 从左向右找第一个大于等于pivot的数
//             while(i < j && arr[i] < pivot) {
//                 i++;
//             }
//             if(i < j) {
//                 arr[j--] = arr[i];
//             }
//         }
        
//         arr[i] = pivot;
//         // printArray(arr, 11);
        
//         // 递归调用
//         quick_sort(arr, left, i - 1); // 排序pivot左边
//         quick_sort(arr, i + 1, right); // 排序pivot右边
//     }
// }

// 快排，左右交换
void QuickSort(int arr[], int left, int right) {
    if (left < right) {
        int pivot = arr[left]; // 取左边第一个为【基准】点
        int i = left;
        int j = right;
        while (i < j) {
            // 从右向左找第一个小于pivot的数：a[j]
            while(i < j && arr[j] >= pivot) {
                j--;
            }
            if(i < j) {
                swap(&arr[i], &arr[j]);
            }
            
            // 从左向右找第一个大于等于pivot的数：a[i]
            while(i < j && arr[i] < pivot) {
                i++;
            }
            if(i < j) {
                swap(&arr[i], &arr[j]);
            }
        }
        printArray(arr, 6); printf("\n");
        // 递归调用
        QuickSort(arr, left, i - 1); // 递归，将pivot左边的数排序
        QuickSort(arr, i + 1, right); // 递归，将pivot右边的数排序
    }
}

// 归并排序 [8,4,5,7,1,3,6,2]  merge_sort(a, 0, 7)
// void merge_sort(int arr[], int start, int end) {
//     if(start < end) {
//         int middle = (start + end + 1) / 2;
//         printf("\nmerge_sort: start=%d, end=%d, mid=%d   ", start,end,middle);
//         if(end - start > 1) {
//             merge_sort(arr, start, middle - 1);
//             merge_sort(arr, middle, end);
//         } else {
//             if(arr[end] < arr[start]) {
//                 printf("---exchange:  ");
//                 swap(&arr[start], &arr[end]);
//             }
//             printf("---sort: %d, %d  ", arr[start], arr[end]);
//             printArray(arr, 8);
//         }
//     } 
// }

static void mergeArray(int *left, int l_size, int *right, int r_size, int *temp) {
	int i, j, k;
	i = j = k = 0;
	while(i < l_size && j < r_size) {
		if (left[i] < right[j]) {
			temp[k++] = left[i++];
		} else {
			temp[k++] = right[j++];
		}
	}
	while(i < l_size) {
		temp[k++] = left[i++];
	}
	while(j < r_size) {
		temp[k++] = right[j++];
	}
 
	for (i = 0; i < l_size + r_size; i++) {
		left[i] = temp[i];
	}
}

void merge_sort(int a[], int length, int temp[]) {
	int *left = a; // left start point
	int *right = a + length / 2; // right start point
	int left_size = length / 2;
	int right_size = length - left_size;
 
	if(length > 1) { // recursion condition
		merge_sort(left, left_size, temp); //sort left group
		merge_sort(right, right_size, temp); //sort right group
		mergeArray(left, left_size, right, right_size, temp); //merge left and right group together
	}
}

// 插入节点 a[index]
struct ListNode* insertNode(struct ListNode *head, int val, int index) {
    if(index < 0) {
        printf("insert error: %d", index);
        return head;
    }
    struct ListNode *node = (struct ListNode *)malloc(sizeof(struct ListNode));
    node->val = val;

    struct ListNode *cursor = head;
    int len = 0;
    while(cursor && (len < index - 1)) {
        cursor = cursor->next;
        len++;
    }
    if(index > len + 1) { // 插入位置越界
        printf("insert error: %d", index); // index > len
        return head;
    }
    if(index == 0) {
        node->next = NULL;
        head = node;
        return head; // 防止链表为空，此时head要重新赋值，原来的head=NULL，已弃用
    }
    node->next = cursor->next;
    cursor->next = node;

    return head;
}

// 链表追加节点
struct ListNode* appendNode(struct ListNode *head, int val) {
    int len = lengthOfList(head);
    return insertNode(head, val, len);
}

// 链表追加链表
struct ListNode* appendList(struct ListNode *head, struct ListNode *list) {
    struct ListNode *newHead = head;
    struct ListNode *cursor = list;
    int len = lengthOfList(head);
    while(cursor) {
        int val = cursor->val;
        newHead = insertNode(head, val, len++);
        cursor = cursor->next;
    }
    return newHead;
}

// 借用新链表，比较排序
struct ListNode* merge2(struct ListNode* l1, struct ListNode* l2) {
    if(!l1) {
        return l2;
    }
    if (!l2) {
        return l1;
    }

    struct ListNode *cursor1 = l1;
    struct ListNode *cursor2 = l2;
    struct ListNode *head = NULL, *tail = head;
    while(cursor1 && cursor2) {
        int value1 = cursor1->val;
        int value2 = cursor2->val;
        int min;
        if (value1 < value2) {
            min = value1;
            cursor1 = cursor1->next;
        } else {
            min = value2;
            cursor2 = cursor2->next;
        }
        struct ListNode *node = (struct ListNode *)malloc(sizeof(struct ListNode));
        node->val = min;
        node->next = NULL;
        if (head) {
            tail->next = node;
            tail = node;
        } else {
            head = node;
            head->next = NULL;
            tail = head;
        }
    }
    if(!cursor1) {
        while(cursor2) {
            tail->next = cursor2;
            tail = cursor2;
            cursor2 = cursor2->next;
        }
    } else {
        while(cursor1) {
            tail->next = cursor1;
            tail = cursor1;
            cursor1 = cursor1->next;
        }
    }

    return head;
}

// 直接插入，在一个有序链表上，插入另一个有序链表
struct ListNode* merge(struct ListNode* l1, struct ListNode* l2) {
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

    return head;
}


struct ListNode* mergeTwoLists(struct ListNode* l1, struct ListNode* l2) {
    // int length = lengthOfList(l1);
    // int length2 = lengthOfList(l2);
    // int totalLength = length + length2;

    // if (!totalLength) {
    //     return NULL;
    // } else if (!length) {
    //     return l2;
    // } else if (!length2) {
    //     return l1;
    // }

    // int arr[length], arr2[length2], newArray[totalLength], newSortedArray[totalLength];
    // arrayFromList(l1, arr, length);
    // arrayFromList(l2, arr2, length2);
    // joinTwoArray(arr, length, arr2, length2, newArray);
   
    // int a[] = {};
    // struct ListNode *list = listFromArray(a, 0);
    // appendNode(list, 2);
    // printListNode(list);

    // int testArray[] = {3,4,6,1,2,5}; //{5,7,4,6,3,1,2,9,8}


    int a[] = {8,4,5,7,1,3,6,2};
    int temp[8];

    merge_sort(a, 8, temp);
    printArray(a, 8);

    return merge(l1, l2); 

    // return listFromArray(newArray, totalLength);
}
