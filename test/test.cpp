#include<iostream>
#include<pbrpc/ServiceManager.hh>
using ::pbrpc::ServiceManager;
using namespace std;
int main(void){
	ServiceManager server;
	 server.init();
	std::cout<<"inside main"<<endl;
}