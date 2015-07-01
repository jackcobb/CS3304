#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

//declarations
void lexical(char *array);
float e();
float t();
float tt(float in);
float ft(float in);
float f();
//float c();

//globals op/num
float num;
char op;

int main (int argc, char *argv[])
{
	char linein[50];
	while (scanf("%s", linein) != EOF)
	{
		num = 0;
		op = ' ';
		lexical(linein);
		float num = e();
		printf("%s = %g\n", linein, num);
	}	
}

void lexical(char * array)
{
	static int ptr;
	static char * lin;
	if (array != NULL)
	{		
		lin = array;
		ptr = 0;				
	}
	if (lin[ptr] == '\0')
	{
		op = ';';
	}	
	else if (lin[ptr] == '+' || lin[ptr] == '-' || lin[ptr] == '*' || lin[ptr] == '/' || lin[ptr] == '(' || lin[ptr] == ')'){
			op = lin[ptr];
			ptr++;
	} 
	else
	{
		num = atof(&lin[ptr]);
		ptr++;
	}	
}

float e()
{
	//printf("In e: num is %f op is %c\n", num, op);
	float in = t();
	return tt(in);
}

float t()
{
//printf("In t: num is %f op is %c\n", num, op);
	float in = f();
	return ft(in);
}

float tt(float in)
{
//printf("In tt: num is %f op is %c\n", num, op);
	if (op == '+')
	{
		lexical(NULL);
		float tv = t();
		float st =  in + tv;
		return tt(st);
	}
	 if (op == '-')
	{
		lexical(NULL);
		float tv = t();
		float st =  in - tv;
		return tt(st);
	}
	return in;
}

float ft(float in)
{
//printf("In ft: num is %f op is %c\n", num, op);
	if (op == '*')
	{
		lexical(NULL);
		float st = (in * f());
		return ft(st);
	}
	if (op == '/')
	{
		lexical(NULL);
		float tv = f();
		float st =  (in / tv);
		return ft(st);
	}
		return in;
}

float f()
{
//printf("In f: num is %f op is %c\n", num, op);
	if (op == '(')
	{
		op = ' ';
		lexical(NULL);
		float numb = e();
		lexical(NULL);
		return numb;
	}
		lexical(NULL);
		return num;
}
