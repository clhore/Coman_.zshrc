#!/usr/bin/python3

f = open("//home//ad5ian//recursos_zsh//pcapc//ipV4.txt", 'r+')

f_text= f.read()
f.truncate(0)

f_text = f_text.replace('addr:', '')
print(f_text)

f.close()
