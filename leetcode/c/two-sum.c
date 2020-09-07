/**
https://leetcode-cn.com/problems/two-sum/

1.给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。

你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。


示例:

给定 nums = [2, 7, 11, 15], target = 9

因为 nums[0] + nums[1] = 2 + 7 = 9
所以返回 [0, 1]
*/

#include <stdlib.h>
#include <string.h>

#define bool int

/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
int *twoSum(int *nums, int numsSize, int target, int *returnSize)
{
    int *result = (int *)malloc(sizeof(int) * 2);

    if (numsSize == 2) {
        result[0] = 0;
        result[1] = 1;
        *returnSize = 2;
        return result;
    }

    int nums_max = nums[0];
    int nums_min = nums[0];
    for(int i = 1; i < numsSize; i++) {
        if (nums[i] > nums_max) {
            nums_max = nums[i];
        }
        if (nums[i] < nums_min) {
            nums_min = nums[i];
        }
    }
    
    // 根据数组中元素的最大值和最小值，确定hash数组的长度
    int maxLength;
    if (nums_min >= 0) {
        maxLength = nums_max + 1; //[0,1]
    } else if (nums_max >= 0) {
        maxLength = -nums_min + nums_max + 1; //[-2,0,2]
    } else {
        maxLength = -nums_min - nums_max + 1; //[-3,-2,-1,0]
    }
    
    int anotherNum;
    // 数组长度过大时，容易爆栈，如 [50000000, 2, 50000000]。此时改用暴力法。
    if (maxLength > 100000) {
        for(int i = 0; i < numsSize - 1; i++) {
            anotherNum = target - nums[i];
            // 边界判断，不符合条件直接跳过
            if (anotherNum > nums_max || anotherNum < nums_min) {
                continue;
            }
            for(int j = i + 1; j < numsSize; j++) {
                if(nums[j] == anotherNum) {
                    result[0] = i;
                    result[1] = j;
                    *returnSize = 2;
                    return result;
                }
            }
        }
    }
    
    int hash[maxLength];
    memset(hash, -1, sizeof(hash));
    // 冲突数组，用于保存hash碰撞的元素下标，如collisionArray[0]=5; 表示nums[0]和nums[5]碰撞
    int collisionArray[numsSize];
    memset(collisionArray, -1, sizeof(collisionArray));
    
    for(int i = 0; i < numsSize; i++) {
        int index = (nums[i] + maxLength) % maxLength;
        if (hash[index] != -1) {
            collisionArray[hash[index]] = i; //[3,1,3] 哈希冲突，collisionArray[0]=2
            continue;;
        }
        hash[index] = i;
    }
    
    for (int i = 0; i < numsSize; i++) {
        anotherNum = target - nums[i];
        if (anotherNum > nums_max || anotherNum < nums_min) {
            continue;
        }
        
        int hashIndex = (anotherNum + maxLength) % maxLength;

        bool whenHashCollision = (collisionArray[i] != -1) && (hash[hashIndex] != -1) && (anotherNum == nums[i]);
        bool whenNoHashCollision = (collisionArray[i] == -1) && (hash[hashIndex] != -1) && (anotherNum != nums[i]);

        if (whenHashCollision) {
            result[0] = i;
            result[1] = collisionArray[i];
             *returnSize = 2;
            return result;
        }
        if (whenNoHashCollision) {
            result[0] = i;
            result[1] = hash[hashIndex];
            *returnSize = 2;
            return result;
        }
    }
    
    return result;
}
