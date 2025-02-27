from Domain.Entities import Client
import os

def cauta_client(lista,id,n):
    if n<0:
        raise ValueError("Clientul nu a fost gasit")
    if lista[n-1].get_id()==id:
        return lista[n-1]
    return cauta_client(lista,id,n-1)

class ClientRepo:
    
    def __init__(self):
        self.__client=[]
        self.__id=0

    def adauga_client(self, client_nou):
        for client in self.__client:
            if client.get_cnp() == client_nou.get_cnp():
                raise ValueError("Exista deja acest CNP!")
        customer = Client(self.__id, client_nou.get_nume(), client_nou.get_cnp())
        self.__client.append(customer)
        self.__id += 1

    def sterge_client(self,id):
        client_nou_lista=[]
        for costumer in self.__client:
            if costumer.get_id()!=id:
                client_nou_lista.append(costumer)
        self.__client=client_nou_lista

    def modifica_client(self,id,nume_nou,cnp_nou):
        client_nou_lista=[]
        ok = 0
        for costumer in self.__client:
            if costumer.get_id()==id:
                costumer.set_nume(nume_nou)
                costumer.set_cnp(cnp_nou)
                ok = 1
            client_nou_lista.append(costumer)
        self.__client=client_nou_lista
        if ok == 0:
            raise ValueError("Clientul nu a fost gasit!")

    def cauta_client_dupa_id(self,id):
        return cauta_client(self.__client,id,len(self.__client))
    
    def cauta_client_dupa_parametru(self,nume):
        for costumer in self.__client:
            if costumer.get_nume()==nume :
                return costumer
            raise ValueError("Clientul nu a fost gasit")
        
    def cauta_id(self,id):
        ok=1
        for elem in self.__client:
            if elem.get_id()==id:
                ok=0
        if ok:
            raise ValueError("Nu exista clientul cu id-ul respectiv")

    def get_all_clients(self):
        return self.__client

    def __eq__(self, other):
        if self.__client==other.__client:
            return True
        return False
    
class ClientsFileRepo(ClientRepo):
    def __init__(self,filename):
        ClientRepo.__init__(self)
        file = os.path.abspath(filename)
        self.__filename = file
        self.__load_from_file()

    def __load_from_file(self):

        with open(self.__filename,"r") as f:
            lines=f.readlines()
            for line in lines:
                if line=="\n":
                    break
                client_id, client_name, client_CNP=[token.strip() for token in line.split(';')]
                customer=Client(int(client_id),client_name,client_CNP)
                ClientRepo.adauga_client(self,customer)

    def __save_in_file(self):
        with open(self.__filename,"w") as f:
            customers=ClientRepo.get_all_clients(self)
            for customer in customers:
                value=str(customer.get_id())+";"+str(customer.get_nume())+";"+str(customer.get_cnp())+"\n"
                f.write(value)

    def adauga_client(self,client_nou):
        ClientRepo.adauga_client(self,client_nou)
        self.__save_in_file()

    def sterge_client(self,id):
        ClientRepo.sterge_client(self,id)
        self.__save_in_file()

    def modifica_client(self,id,nume_nou,cnp_nou):
        ClientRepo.modifica_client(self,id,nume_nou,cnp_nou)
        self.__save_in_file()

    def search_client_by_id(self,id):
        return ClientRepo.cauta_client_dupa_id(self,id)

    def cauta_client_dupa_parametru(self,nume,cnp):
        return ClientRepo.cauta_client_dupa_parametru(self,nume,cnp)

    def cauta_id(self,id):
        return ClientRepo.cauta_id(self,id)

    def get_all_clients(self):
        return ClientRepo.get_all_clients(self)

    def __eq__(self, other):
        return ClientRepo.__eq__(self,other)
  