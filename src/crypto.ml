let digest s = Nocrypto.Hash.(digest `SHA256) (Cstruct.of_string s)

