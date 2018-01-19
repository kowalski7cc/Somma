#include<stdlib.h>
#include<stdio.h>

struct acc
{
  char * mem;
  int size;
};

static bool error = false;

float somma(acc * a, char b[], int p)
{
	if (a == NULL)
	{
		a = (acc *)malloc(sizeof(acc));
    	a->mem = (char *) malloc(sizeof(char)*15);
    	a->size = 0;
	}
	
	char c = b[p];
	if (c == '\0')
	{
		a->mem[a->size] = '\0';
		return atof(a->mem);
	}
	else if(c == ' ')
	{
		a->mem[a->size] = '\0';
	    return atof(a->mem) + somma(NULL, b, p+1);
	}
	else if ((c >= '0' && c <= '9') || c == '.')
	{
		a->mem[a->size++] = c;
		return somma(a, b, p+1);
	}
	else
	{
		error = true;
		return 0;
	}
}

int main(int argc, char *argv[])
{
	if(argc > 1)
	{
		float r = somma(NULL, argv[1], 0);
		if (!error)
			printf("Risultato: %f\n", r);
		else
			printf("Errore nella computazione dell'input: \"%s\"\n", argv[1]);
	} else {
		printf("Non sono pervenuti argomenti\n");
	}
}