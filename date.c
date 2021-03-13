#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<assert.h>

struct date{
  int day;
  int month;
  int year;
};

struct date* allocate_date(int init_day, int init_month, int init_year);
int is_date_valid(int day, int month, int year);

int get_day(struct date* p_date);
int get_month(struct date* p_date);
int get_year(struct date* p_date);

void set_day(struct date* p_date, int new_day);
void set_month(struct date* p_date, int new_month);
void set_year(struct date* p_date, int new_year);

void deallocate_date(struct date* p_date);

int main(void){
    int             choice;
    int             day;
    int             month;
    int             year;
    int             yyyy;
    int             mm;
    int             dd;
    struct date*     current;
    current = allocate_date(1,1,1970);

    while(1){
        printf("\nEnter -1 to terminate...");
        scanf("%d", &choice);
        if(choice < 0){
            exit(0);
        }
        printf("\nEnter the year: ");
        scanf("%d", &year);
        printf("\nEnter the month of year: ");
        scanf("%d", &month);
        printf("\nEnter the day of month: ");
        scanf("%d", &day);

        set_year(current, year);
        set_month(current, month);
        set_day(current, day);

        yyyy = get_year(current);
        mm = get_month(current);
        dd = get_day(current);
        printf("\n* %d/%d/%d\n", dd, mm, yyyy);
    }
    deallocate_date(current);
}

struct date* allocate_date(int init_day, int init_month, int init_year){
    struct date* p_date = NULL;

    p_date = (struct date*)malloc(sizeof(struct date));
    assert(p_date != NULL);
    memset(p_date, 0, sizeof(struct date));

    p_date->day = init_day;
    p_date->month = init_month;
    p_date->year = init_year;

    return (p_date);
}

int is_date_valid(int day, int month, int year){
    int     isLeap = 1;
    int     valid = 1;
    /* The leap year case. */
    if(year <0 || year > 9999){
       return (0);
    }
    if((year % 4 == 0) && ( year % 100 != 0) || (year % 400 == 0)){
        isLeap = 0;
    }
    /* if( month == 2 ){ */
    /*     if( isLeap == 0 && (0 < day && day <= 29) ){ */
    /*         valid = 1; */
    /*     } else if(0 < day && day <= 28){ */
    /*         valid = 1; */
    /*     } else { */
    /*         valid = 1; */
    /*     } */
    /* } else if((month%2 == 0 || month == 1)  && (0 < month && month < 7) */
    /*         && (0 < day && day <= 30)){ */
    /*     printf("__DBG__1"); */
    /*     valid = 1; */
    /* } else if(((month%2 == 0) || (month == 7)) && */
    /*           (7 < month && month <= 12) && (0 < day && day <= 31)){ */
    /*     printf("__DBG__2"); */
    /*     valid = 1; */
    /* } */
    if(day < 0 || day > 31){
        valid = 0;
    } else if(month < 0 || month > 12){
        valid = 0;
    }
    if(month == 2){
        printf("\n*\t[%d]\t*\n", isLeap);
        if((isLeap == 0) && (day < 0 || day > 29)){
            valid = 0;
        } else if((isLeap == 1) && (day < 0 || day > 28)){
            valid = 0;
        }
    } else if(month == 4 || month == 6 || month == 9 || month == 11){
        if(day < 0 && day > 30){
            valid = 0;
        }
    } else if(day < 0 && day > 31){
            valid = 0;
    }
    /* printf("\n*\t[%d]\t*\n", valid); */
    return (valid);
}

int get_day(struct date* p_date){
    return (p_date->day);
}

int get_month(struct date* p_date){
    return (p_date->month);
}

int get_year(struct date* p_date){
    return (p_date->year);
}

void set_day(struct date* p_date, int new_day){
    if(is_date_valid(new_day, p_date->month, p_date->year) != 1){
        puts("Invalid date. exiting");
        exit(-1);
    }

    p_date->day = new_day;
}

void set_month(struct date* p_date, int new_month){
    if(is_date_valid(p_date->day, new_month, p_date->year) != 1){
        puts("Invalid month. exiting");
        exit(-1);
    }

    p_date->month = new_month;
}

void set_year(struct date* p_date, int new_year){
    if(is_date_valid(p_date->day, p_date->month, new_year) != 1){
        puts("Invalid year. existing");
        exit(-1);
    }

    p_date->year = new_year;
}

void deallocate_date(struct date* p_date){
    free(p_date);
    p_date = NULL;
}
