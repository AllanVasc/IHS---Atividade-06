# Rodar o comando: sudo apt-get install gcc-multilib
# Se estiver dando problema no Make!

nasm_flags = -f elf32

all: build link run

# Buildando arquivos .o
build: sort.asm main.c 
	@nasm $(nasm_flags) sort.asm -o sort.o
	@gcc -m32 -c main.c -o main.o
	@gcc -m32 -c print.c -o print.o

# Realizando a linkagem dos arquivos .o
link: main.o sort.o print.o
	@gcc -m32 -no-pie main.o sort.o print.o -o teste

# Roda o programa
run: teste 
	@./teste

# .PHONY means clean is not a file or an object
.PHONY: clean 

# Limpa os arquivos criados
clean: 
	rm *.o teste