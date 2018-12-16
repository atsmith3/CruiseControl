#include <iostream>
using namespace std;


int main(){

	cout << "Hello world!" << endl;

	int x,y, j;
	x = 5; 

	int i = 0; 
	for(i = 0; i < 10; i++){
			if(x == 5){
				y = 7; 
			}
			else{
				y = 9; 
			}
			for(j = 0; j < 10; j++){
				y++;
				cout << y << endl;
			}
	}

	return 0; 

}



