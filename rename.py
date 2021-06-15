#!/bin/python3

# Abrimos los archivos con los que vamos a trabajar
zshrc = open('./.zshrc', 'r+')
user = open('./user', 'r+')


# Leemos el contenido de los archivos
R_zsh = zshrc.read()
R_user = user.read()


# Eliminamos los saltos de linea
R_user = R_user.rstrip('\n')


# Numero de veces que aparece ad5ian en el archivo
nv_I = R_zsh.count('ad5ian')


# Remplazamos ad5ian por el usuario introducido
R_zsh = R_zsh.replace('ad5ian', R_user)


# Borramos el contenido del viejo archivo
zshrc.truncate(0)
user.truncate(0)


# Escrivimos el archivo con los parametros correctos
zshrc.write(R_zsh)


# Numero de veces que aparece el nombre del usuario introducido en el archivo creado
nv_F = R_zsh.count('BELEN')


# Si el numero nv_I y el nv_F no son iguales nos mandara un error por consola
if nv_I == nv_F:
    print('perfect')
else:
    print('error')


# Cerramos los archivos
zshrc.close()
user.close()
