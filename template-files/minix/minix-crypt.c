/* 
 * Compile: cc -lcrypt -o /usr/sbin/crypt_pw minix-crypt.c
 */

#include <stdio.h>
#include <unistd.h>

int main(int argc, char **argv) {
        printf("%s", crypt(argv[1], "1"));
}
