#include "grafo.h"

Grafo::Grafo() { //funcionando
	this->N=0;
	Lista=new list<unsigned int>[N];
	for (int i = 0; i < N; i++) {
		Matriz.push_back(vector<unsigned int>());
		}

	for (int j = 0; j < N; j++) {
	    for (unsigned int i = 0; i < Matriz.size(); i++) {
		Matriz[i].push_back(0);
	    }
	
	}
};


Grafo::Grafo(int N) { //funcionando
	this->N=N;
	Lista=new list<unsigned int>[N];
	for (int i = 0; i < N; i++) {
		Matriz.push_back(vector<unsigned int>());
		}

	for (int j = 0; j < N; j++) {
	    for (unsigned int i = 0; i < Matriz.size(); i++) {
		Matriz[i].push_back(0);
	    }
	
	}
};	


void Grafo::Add_Arco(int d, int h, int w) { //funcionando
	if(d>=N || h>=N){
		cout << "Nodo(s) no existe(n)" << endl;
	}
	else {
		Matriz[d][h]=w;
		Lista[d].push_back(h);
	}
};

	
int Grafo::Add_Nodo() { //funcionando
	N+=1;
	Matriz.push_back(std::vector<unsigned int>());
	for(int i=0; i<N-1; i++){
		Matriz[i].push_back(0);
	}
	for(int i=0; i<N; i++){
		Matriz[N-1].push_back(0);
	}
	Lista = new list<unsigned int>[N];
	for(int i=0; i<N; i++) {
		for(int j=0; j<N; j++) {
			if(Matriz[i][j]!=0) 
				Lista[i].push_back(j);
		}
	}
	
	return N;
};

	
bool Grafo::Hay_Arco(int d, int h) { //funcionando
	bool nohay=false;
	if(Matriz[d][h]==0) return nohay;
	else if(d>=N || d<0 || h>=N || h<0) return nohay;
	else return !nohay;
};


bool Grafo::Hay_Camino(int d, int h){ //funcionando
	if (d == h)
		return true;
		
	vector<bool> visitados; 
	for (int i = 0; i < N; i++){
		visitados.push_back(false);
	}
	
	list<unsigned int> fila;
	visitados[d]=true; 	
	fila.push_back(d); 	
	list<unsigned int>::iterator i; 	
	while (fila.size()!=0) {
		d=fila.front(); 	
		fila.pop_front(); 	
		for (i=Lista[d].begin(); i!=Lista[d].end(); i++) { 	
			if (*i==(unsigned int)h){ 	
				return true;
			}
			else if (!visitados[*i]) { 	
				visitados[*i]=true;	
				fila.push_back(*i);	
			}
		}	
	}
	return false;
};


void Grafo::ImprimeMatriz() {
	for(int i=0; i<N; i++) {
		cout << "Nodo: " << i << endl;
		for(int j=0; j<N; j++) {
			if(Matriz[i][j]!=0)
				cout << "Peso arco "<< i << "-" << j << ": " << Matriz[i][j] << endl;
			else
				continue;
		}
		cout<<endl;
	}
};


