
// https://leetcode-cn.com/problems/median-of-two-sorted-arrays/

// 打印数组
//void printArray(int *array, int length) {
//    printf("\narray: ");
//    for(int i = 0; i < length; i++) {
//        printf("%d, ", *(array+i));
//    }
//    printf("\n");
//}

#include <stdlib.h>

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
 
	// for (i = 0; i < l_size + r_size; i++) {
	// 	left[i] = temp[i];
	// }
}

// 归并排序（递归）
static void merge_sort(int a[], int length, int temp[]) {
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

// 使用【归并排序】合并两个有序数组，取中间值即为【中位数】
double findMedianSortedArrays(int* nums1, int nums1Size, int* nums2, int nums2Size){
    int length = nums1Size + nums2Size;
    int *result = (int *)malloc(sizeof(int) * length);

    mergeArray(nums1, nums1Size, nums2, nums2Size, result);

    double median;
    if(length % 2) {
        median = (double)result[length / 2];
    } else {
        median = ((double)result[length / 2] + (double)result[length / 2 - 1]) / 2;
    }
    free(result);
    return median;
}
