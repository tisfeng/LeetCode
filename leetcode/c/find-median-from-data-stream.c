
// https://leetcode-cn.com/problems/find-median-from-data-stream/

// typedef struct MedianFinder MedianFinder;

#include <stdlib.h>
#include <limits.h>

// Definition for singly-linked list.
struct ListNode {
      int val;
      struct ListNode *next;
 };

#define MAX_SIZE 100000

typedef struct {
    int data[MAX_SIZE];
    int length;

    int step; //步长
    int *store; //间隔存储
    int storeIndex[MAX_SIZE];
} MedianFinder;

/** initialize your data structure here. */


MedianFinder* medianFinderCreate() {
    MedianFinder *mf = (MedianFinder *)malloc(sizeof(MedianFinder));
    // int a[] = {[0 ... 10] = -11};
    // mf->store = {[0 ... MAX_SIZE - 1] = -9999};
    // mf->store[10] = {-1,-1};

    int a[] = {[0 ... MAX_SIZE - 1] = INT_MIN};
    mf->store = a;


    mf->length = 0;
    mf->step = 10;
    return mf;
}

// 若 a[10-20] 段已填满，则后移一个位置 
void move(MedianFinder *obj, int start, int end) {
    for(int i = end; i > start; i++) {
        obj->store[i+1] = obj->store[i];
 
    }
}


// 取出真正的排序数列
void sort_data(MedianFinder *obj) {
    int index = 0;
    for(int i = 0; i <= obj->length * obj->step; i++) {
        if(obj->store[i] != INT_MIN) {
            obj->data[index] = obj->store[i];
        }
    }
}

// 打印数组
// void printArray(int *array, int length) {
//     printf("\narray: ");
//     for(int i = 0; i < length; i++) {
//         printf("%d, ", *(array+i));
//     }
//     printf("\n");
// }
// 插入排序 [2,1,3,5,4]-->[1,2,3,4,5]
// void insertSortedArray(int *arr, int length) {
//     for(int i = 1; i < length; i++) { //插入第i个数，然后进行排序
//         insert_sort(arr, i, arr[i]);
//     }
// }

// [0, 100]中间插入，a[50]
void insertDataInRange(MedianFinder *obj, int start, int end, int num) {
    int middle;
    while(end - start > 1) { //二分法，查找插入位置
        middle = (start + end) / 2;
        if(obj->store[middle] != INT_MIN) {
            obj->store[middle] = num;
            break;
        }
        if(num < obj->store[middle]) {
            end = middle;
        } else {
            start = middle;
        }
    }

}

static void insert_sort(MedianFinder *obj, int num) {
    int *a = obj->data;
    int length = obj->length;
    int step = obj->step;
    if(!length) {
        a[step] = num;
        obj->storeIndex[length] = step;
    } else if(num >= a[length - 1]) {
        a[(length + 1) * step] = num;
        obj->storeIndex[length] = (length + 1) * step;
    } else {
        int insertIndex;
        if(num < a[0]) {
            insertIndex = 0;  
              
        } else {
            int start = 0, end = length - 1;
            int middle;
            while(end - start > 1) { //二分法，查找插入位置
                middle = (start + end) / 2;
                if(a[middle] == num) {
                    end = middle + 1;
                    break;
                }
                if(a[middle] > num) {
                    end = middle;
                } else {
                    start = middle;
                }
            }
            insertIndex = end;
        }  
        for(int j = length; j > insertIndex; j--) { //大的元素后移
            a[j] = a[j-1];
        }
        a[insertIndex] = num;
    } 
    // printArray(a, length+1);
}

// 二分法，查找插入位置，将num插入已排好序的数组a
// void insert_sort(int a[], int length, int num) {
//     if(!length) {
//         a[0] = num;
//     } else if(num >= a[length - 1]) {
//         a[length] = num;
//     } else {
//         int insertIndex;
//         if(num < a[0]) {
//             insertIndex = 0;    
//         } else {
//             int start = 0, end = length - 1;
//             int middle;
//             while(end - start > 1) { //二分法，查找插入位置
//                 middle = (start + end) / 2;
//                 if(a[middle] == num) {
//                     end = middle + 1;
//                     break;
//                 }
//                 if(a[middle] > num) {
//                     end = middle;
//                 } else {
//                     start = middle;
//                 }
//             }
//             insertIndex = end;
//         }  
//         for(int j = length; j > insertIndex; j--) { //大的元素后移
//             a[j] = a[j-1];
//         }
//         a[insertIndex] = num;
//     } 
//     // printArray(a, length+1);
// }

// 将num插入已排好序的数组a
// void insert_sort2(int a[], int length, int num) {
//     if(!length) {
//         a[0] = num;
//     } else if(num >= a[length - 1]) {
//         a[length] = num;
//     } else {
//         int insertIndex = -1;
//         for(int i = 0; i < length; i++) {
//             if(num < a[i]) {
//                 insertIndex = i;
//                 break;
//             }
//         }
//         if(insertIndex != -1) {
//             for(int j = length; j > insertIndex; j--) {
//                 a[j] = a[j-1];
//             }
//             a[insertIndex] = num;
//         }
//     } 
//     // printArray(a, length+1);
// }

void medianFinderAddNum(MedianFinder* obj, int num) {
    // obj->data[obj->length] = num;
    // insert_sort(obj->data, obj->length++, num);
}

double medianFinderFindMedian(MedianFinder* obj) {
    double median; 

    if(obj->length % 2) {
        median = obj->data[obj->length/2];
    } else {
        median = (double)(obj->data[obj->length/2] + obj->data[obj->length/2 - 1]) / 2;
    }
    return median;
}

void medianFinderFree(MedianFinder* obj) {
    free(obj);
}

/**
 * Your MedianFinder struct will be instantiated and called as such:
 * MedianFinder* obj = medianFinderCreate();
 * medianFinderAddNum(obj, num);
 
 * double param_2 = medianFinderFindMedian(obj);
 
 * medianFinderFree(obj);
*/
