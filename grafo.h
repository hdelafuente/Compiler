#ifndef GRAFO_H
#define GRAFO_H

#include <vector>
#include <iostream>
#include <iterator>
#include <list>
using namespace std;

class Grafo {
protected:
int N;
list<unsigned int> *Lista; //guarda los arcos
vector<vector<unsigned int>> Matriz; //guarda el peso del arco
public:
	Grafo();	
	Grafo(int N);	
	void Add_Arco(int d, int h, int w);		
	int Add_Nodo();	
	bool Hay_Arco(int d, int h);	
	bool Hay_Camino(int d, int h);	
	void ImprimeMatriz();
	virtual ~Grafo() {
		delete []Lista;
	}

};
#endif
