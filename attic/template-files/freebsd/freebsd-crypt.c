/* 
 * Compile: gcc -lcrypt -o /usr/local/bin/cryptpw freebsd-crypt.c
 */

#include <stdio.h>
#include <unistd.h>

int main(int argc, char **argv) {
        crypt_set_format("sha512");
        printf("%s", crypt(argv[1], "1"));
}
