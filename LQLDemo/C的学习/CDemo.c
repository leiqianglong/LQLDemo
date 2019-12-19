//
//  CDemo.c
//  LQLDemo
//
//  Created by LQL on 2019/8/9.
//  Copyright © 2019 com.lal. All rights reserved.
//

#include "CDemo.h"

//定义常量
#define WIDTH 30
#define NEWLINE '\n'
//const 来申明常量
const int HEIGHT = 100;

int x;
int y;

int addtwonum(){
    extern int x;
    extern int y;
    x = 10;
    y = 20;
    return x+y;
}
//递归
double factorial(unsigned int i){
    if (i <= 1) {
        return 1;
    }
    return i * factorial(i-1);
}

//冒泡排序
void bubble_sort(int arr[],int len){
    int i,j,temp;
    for (i=0; i<len-1; i++) {
        for (j=0; j<len-1-i; j++) {
            if (arr[j] > arr[j+1]) {
                temp = arr[j];
                arr[j] = arr[j+1]; //交换
                arr[j+1] = temp;
            }
        }
    }
}

typedef int BOOL;
#define YES 1
#define NO 0
//判断闰年
BOOL judgeLeapYear(int year){
    if (year %4 == 0) {
        if (year % 100 == 0) {
            if (year % 400 == 0) {
                return YES;
            }else{
                return NO;
            }
        }else{
            return YES;
        }
    }else{
        return NO;
    }
}

//输出99乘法表
void multiplicationTab(void){
    int i = 0,j = 0;
    for (i = 1; i <= 9; i++) {
        for (j = 1; j<=i; j++) {
            printf("%dx%d=%d\t",j,i,i*j);
        }
        printf("\n");
    }
    
}

//打印地址
void printAddress(){
    int a = 100;
    char str[20] = "c.biancheng.net";
    printf("%p,%p\n",&a,str);
    
    float m = 99.3,n = 100.9;
    char c = '@',d = '#';
    //定义指针变量
    float *p1 = &m;
    char *p2 = &c;
    //修改指针变量的值
    p1 = &n;
    p2 = &d;
    printf("%p %p\n",p1,p2);
    //通过指针变量取值
    printf("%f %f\n",m,*p1);
    
    double x = 99.99,*px = &x;
    printf("px原始值 === %p\n",px);
    px++;
    printf("px1 === %p\n",px);
    px -= 2;
    printf("px11 === %p\n",px);
    
}

//数组
void array(){
    int arr[] = {22,33,545,664,199};
    int length = sizeof(arr) / sizeof(int);//求数组长度
    int i;
    
    printf("%d\n",*arr);// *arr 相当于数组的 firstObj的 地址
    
    for (i=0; i<length; i++) {
        printf("%d ",*(arr + i)); //*(arr+i)等价于arr[i]
    }
}
int mainc(){
    int result;
    result = addtwonum();
    printf("result 的值为:%d\n",result);
    printf("%c",NEWLINE);
    int area;
    area = WIDTH * HEIGHT;
    printf("%d\n",area);
    
    //计算m阶乘
    int m = 10;
    printf("10的阶乘是:%f\n",factorial(m));
    
    //冒泡排序
    int arr[] = {22,34,3,23,45,355,234,6,5,33,234,22,78};
    int len = (int) sizeof(arr) / sizeof(*arr);
    //    printf("len ==== %d\n",len); //数组个数
    //    printf("len111 ==== %lu\n",sizeof(arr));//数组内存大小
    //    printf("len222 ==== %lu\n",sizeof(*arr));//数组元素内存大小
    bubble_sort(arr, len);
    for (int i = 0; i < len; i++) {
        printf("数组的元素:%d\n",arr[i]); //数组个数
    }
    
    //判断是否闰年
    printf("湿润年吗:%d\n",judgeLeapYear(2019));
    //输出99乘法表
    multiplicationTab();
    
    printAddress();
    
    array();
    return 0;
}


